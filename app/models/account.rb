class Account < ApplicationRecord
    has_one :user, class_name: "User"
    
    validates :name, presence: true
    
    def titulo_completo
        "Titulo completo com o nome do cartao"
    end
    
end
