class CategoriesController < ApplicationController

    def index
        @category = Category.new
    end

    def create
        categoryParameters = params[:category]
        @category = Category.new          
        @category.description = categoryParameters[:description]
        
        if categoryParameters[:description].empty?
            flash[:notice] = "O campo Descrição deve ser preenchido."
            redirect_to index
        else 
            #Category.user_id = session[:user_id]
            flash[:notice] = @category.save[1]
            #session[:user_id]=result[1]
            redirect_to index
        end
    end    
end