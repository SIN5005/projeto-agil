class CategoriesController < ApplicationController

    def index
        @category = Category.new
    end

    def create
        categoryParameters = params[:category]
        @category = Category.new          
        @category.description = categoryParameters[:description]
        
        @category.user_id = session[:user_id]

        
        if categoryParameters[:description].empty?
            flash[:notice] = "O campo Descrição deve ser preenchido."
            redirect_to index
        else             
            flash[:notice] = @category.save[1]
            #session[:user_id]=result[1]
            redirect_to index
        end
    end    
end