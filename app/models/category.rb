class Category < ApplicationRecord
  belongs_to :user
  #belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates :description, presence: true
  validates_presence_of :user_id
  
    def save
        query = "INSERT INTO CATEGORIES (DESCRIPTION, CREATED_AT, UPDATED_AT) VALUES(%s, now(), now());"

        begin
            status = Category.find_by_sql(query % [Category.connection.quote(description)])          
        rescue
            status = false
        end

        if status            
            [status, "Salvo com sucesso."]
        else
            [status, "Erro ao salvar."]
        end
    end 
end