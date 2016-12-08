# coding: utf-8
class UsersController < ApplicationController
    def index
        @user = User.new
    end  

    def password        
    end

    def forgot_password
    end

    def forgot
        @user           = User.new
        @user.id        = -1
        @user.email     = params[:email]
        @user.password  = "#{rand(1...9)}#{rand(1...9)}#{rand(1...9)}#{rand(1...9)}"

        if not @user.email_already_registered
            flash[:notice] = "E-mail não cadastrado."
            redirect_to :forgot_password
        else   
            @user.update_password
            PasswordMailer.sample_email(@user).deliver 
            flash[:notice] = "E-mail enviado com sucesso."
            redirect_to :forgot_password
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
    end

    def change_password        
        passwd       = params[:newpass]
        confirmation = params[:confirmation]
        if not passwd.eql?(confirmation)
            flash[:notice] = "A senha esta diferente da confirmação de senha."
            redirect_to :password
        elsif passwd.length < 4
            flash[:notice] = "A senha deve conter 4 caracteres ou mais."
            redirect_to :password
        else
            @user           = User.new            
            @user.id        = session[:user_id]
            @user.password  = passwd            
            flash[:notice]  = @user.update_password[1]
            redirect_to :password
        end        
    end

    def create
        userParameters  = params[:user]
        @user           = User.new
        @user.name      = userParameters[:name]
        @user.email     = userParameters[:email]
        @user.password  = userParameters[:password]

        if userParameters[:name].empty?
            flash[:notice] = "O campo nome deve ser preenchido."
            redirect_to index
        elsif userParameters[:email].empty?
            flash[:notice] = "O campo e-mail é obrigatório."
            redirect_to index       
        elsif userParameters[:password].length < 4
            flash[:notice] = "A senha deve conter pelo menos 4 caracteres."
            redirect_to index
        elsif userParameters[:password_confirmation] != userParameters[:password]
            flash[:notice] = "Senha e confirmação não conferem."
            redirect_to index
        elsif @user.email_already_registered
            flash[:notice] = "E-mail já cadastrado."
            redirect_to index
        elsif 
            flash[:notice] = @user.save[1]
            redirect_to index
        end  
    end 
end