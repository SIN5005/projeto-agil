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
    
    def validates
           
    end
    
    def get_by_name
    end
    
    def account_already_registered
    end
    
    def titulo_completo
        "Titulo completo com o nome do cartao"
    end
    
end
