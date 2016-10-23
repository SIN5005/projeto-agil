# coding: utf-8
class UsersController < ApplicationController
    def index
        @user = User.new
    end  

    def create
        @user = User.new  	
        userParameters = params[:user]

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
        elsif userParameters[:password_confirmation] == userParameters[:password]
            query = "SELECT * FROM USERS WHERE LOWER(EMAIL) = LOWER(%s);"               
            usersList = User.find_by_sql(query % [User.connection.quote(userParameters[:email])])

            if not usersList.empty?
                flash[:notice] = "E-mail já cadastrado."
                redirect_to index
            else
                query = "INSERT INTO USERS (NAME, EMAIL, PASSWORD, CREATED_AT, UPDATED_AT) VALUES(%s, %s, md5(%s), now(), now());"
                if User.find_by_sql(query % [User.connection.quote(userParameters[:name]),
                                             User.connection.quote(userParameters[:email]), 
                                             User.connection.quote(userParameters[:password])])
                    flash[:notice] = "Salvo com sucesso."
                    redirect_to index
                else
                    flash[:notice] = "Erro ao salvar."
                    redirect_to index
                end
            end
        end  
    end
end