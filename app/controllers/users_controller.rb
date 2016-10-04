# coding: utf-8
class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    query = <<-SQL
       INSERT INTO USERS (
           NAME, EMAIL, PASSWORD, CREATED_AT, UPDATED_AT)
       VALUES(
          %s, %s, crypt(%s, gen_salt('md5')), now(), now());
    SQL

    userParameters = params[:user]
    if userParameters[:password_confirmation] == userParameters[:password]
      respond_to do |format|
        if User.find_by_sql(query % [User.connection.quote(user_params[:name]),User.connection.quote(user_params[:email]), User.connection.quote(user_params[:password])])
          #'Salvo com sucesso.'          
          format.html { redirect_to @user, notice: 'Salvo com sucesso' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "Senha e confirmação não conferem."
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
