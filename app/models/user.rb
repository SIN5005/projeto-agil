class User < ApplicationRecord
	validates :name, presence: true
	validates :email, uniqueness: true

	def save
        query = "INSERT INTO USERS (NAME, EMAIL, PASSWORD, CREATED_AT, UPDATED_AT) VALUES(%s, %s, md5(%s), now(), now());"
        User.find_by_sql(query % [User.connection.quote(name),
                                  User.connection.quote(email), 
                                  User.connection.quote(password)])          
    end    

    def email_already_registered
        query = "SELECT * FROM USERS WHERE LOWER(EMAIL) = LOWER(%s);"               
        not User.find_by_sql(query % [User.connection.quote(email)]).empty?        
    end
end
