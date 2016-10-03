class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create    
    @user = User.new(user_params)
    userParameters = params[:user]
    if userParameters[:password_confirmation] == userParameters[:password]
      respond_to do |format|
        if @user.save                    
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
