class Category < ApplicationRecord
  belongs_to :user
  #belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates :description, presence: true
  validates_presence_of :user_id
  
    def save
        query = "INSERT INTO CATEGORIES (DESCRIPTION, USER_ID, CREATED_AT, UPDATED_AT) VALUES(%s, %s, now(), now());"

        begin
            status = Category.find_by_sql(query % [Category.connection.quote(description),
                                                   Category.connection.quote(user_id)])
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