class DefaultController
  def create(obj, format)    
      if @obj.save
        format.html { redirect_to @obj, notice: 'Was successfully created.' }
        format.json { render :show, status: :created, location: @obj }
      else
        format.html { render :new }
        format.json { render json: @obj.errors, status: :unprocessable_entity }
      end
  end
end
