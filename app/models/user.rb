class User < ApplicationRecord
    validates :name, presence: true
    validates :email, uniqueness: true

    def save
        query = "INSERT INTO USERS (NAME, EMAIL, PASSWORD, CREATED_AT, UPDATED_AT) VALUES(%s, %s, md5(%s), now(), now());"

        begin
            status = User.find_by_sql(query % [User.connection.quote(name),
                                               User.connection.quote(email), 
                                               User.connection.quote(password)])          
        rescue
            status = false
        end

        if status            
            [status, "Salvo com sucesso."]
        else
            [status, "Erro ao salvar."]
        end
    end    

    def email_already_registered
        query = "SELECT * FROM USERS WHERE LOWER(EMAIL) = LOWER(%s);"               
        not User.find_by_sql(query % [User.connection.quote(email)]).empty?
    end

    def login
        query = "SELECT * FROM USERS WHERE LOWER(EMAIL) = LOWER(%s) AND PASSWORD = MD5(%s);"
        @list = User.find_by_sql(query % [User.connection.quote(email), User.connection.quote(password)])
        if @list.empty?
            [false, -1]
        else
            [true, @list[0].id]
        end
    end
end
