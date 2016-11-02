# coding: utf-8
class LoginController < ApplicationController
    def index
    end

    def login
        @user           = User.new
        @user.email     = params[:email]
        @user.password  = params[:password]

        if @user.email.empty?
            flash[:notice] = "Preencha o e-mail."
            redirect_to :login
        elsif @user.password.empty?
            flash[:notice] = "Preencha a senha."
            redirect_to :login
        elsif not @user.email_already_registered
            flash[:notice] = "E-mail não cadastrado."
            redirect_to :login
        else 
            result = @user.login
            if not result[0]
                flash[:notice] = "Senha incorreta."
                redirect_to :login
            else
                session[:user_id] = result[1]
                flash[:notice] = "Sucesso."
                redirect_to :login
            end
        end    
    end
end
