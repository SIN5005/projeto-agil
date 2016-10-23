# coding: utf-8
class UsersController < ApplicationController
    def index
        @user = User.new
    end  

    def create
        userParameters  = params[:user]
        @user           = User.new 	        
        @user.name      = userParameters[:name]
        @user.email     = userParameters[:email]
        @user.password  = userParameters[:password ]

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
            if @user.save
                flash[:notice] = "Salvo com sucesso."
                redirect_to index
            else
                flash[:notice] = "Erro ao salvar."
                redirect_to index
            end
        end  
    end    
end