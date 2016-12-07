class Account < ApplicationRecord
    has_one :user, class_name: "User"
    
    validates :name, presence: true
    
    def save
        query = "INSERT INTO ACCOUNTS (NAME, USER_ID, CREATED_AT, UPDATED_AT, BALANCE) VALUES (%s, %d, now(), now(), %f);"
        
        begin
            status = Account.find_by_sql(query % [Account.connection.quote(name),
                                                  Account.connection.quote(user_id), 
                                                  Account.connection.quote(balance)])
        rescue
            status = false
        end
        
        if status
            [status, "Salvo com sucesso!"]
        else
            [status, "Erro ao salvar"]
        end
    end
    
    def get_by_name
        query = "SELECT * FROM ACCOUNTS WHERE NAME = %s AND USER_ID = %d"
        Account.find_by_sql(query % [Account.connection.quote(name),
                                     Account.connection.quote(user_id)])
    end
    
    def name_already_registered
        not get_by_name.empty?
    end
    
end
