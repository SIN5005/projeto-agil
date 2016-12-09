class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
        @categories = Category.joins(:user).where( users: { id: session[:user_id] } )
    end
    
    def new
        @category = Category.new
    end
    
    def destroy
        @category = Category.find (params[:id])
        @category.destroy
        redirect_to(action: 'index')
        #redirect_to '/categories/new', :notice => "Sua categoria foi excluída."
    end
    
    def create
        categoryParameters = params[:category]
        @category = Category.new          
        @category.description = categoryParameters[:description]
        @category.user_id = session[:user_id]

        if categoryParameters[:description].empty?
            flash[:notice] = "O campo Descrição deve ser preenchido."
            redirect_to :new_category
        else             
            flash[:notice] = @category.save[1]
            redirect_to action: "index"
        end
    end
    
    private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:description)
    end
end