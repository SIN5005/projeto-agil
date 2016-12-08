class User < ApplicationRecord
    has_many :categories, :class_name => "Category"
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

    def get_by_email
        query = "SELECT * FROM USERS WHERE LOWER(EMAIL) = LOWER(%s);"
        User.find_by_sql(query % [User.connection.quote(email)])
    end

    def email_already_registered
        not get_by_email.empty?
    end

    def login
        list = get_by_email
        usrRetries = User.new;
        if not list.empty?
            usrRetries = list[0];
        end
        if usrRetries.retries == 3 and usrRetries.release_at > Time.now
            [false, -2]
        else
            query = "SELECT * FROM USERS WHERE LOWER(EMAIL) = LOWER(%s) AND PASSWORD = MD5(%s);"
            list = User.find_by_sql(query % [User.connection.quote(email), User.connection.quote(password)])
            if list.empty?
                ret = 1
                if usrRetries.retries > 3
                    ret = -2
                end
                puts "retries"
                puts usrRetries.retries

                query = "UPDATE USERS SET RETRIES = RETRIES + #{ret}, RELEASE_AT = (now() + interval '10' minute) WHERE EMAIL = %s"
                User.find_by_sql(query % [User.connection.quote(email)])               
                [false, -1]
            else
                query = "UPDATE USERS SET RETRIES = 0 WHERE EMAIL = %s"
                User.find_by_sql(query % [User.connection.quote(email)])
                [true, list[0].id]
            end
        end
    end

    def update_password
        query = "UPDATE USERS SET PASSWORD = md5(%s), UPDATED_AT = now() WHERE ID = %d OR LOWER(EMAIL) = LOWER(%s)"

        begin
            status = User.find_by_sql(query % [User.connection.quote(password),
                                               User.connection.quote(id),
                                               User.connection.quote(email)])
        rescue
            status = false
        end

        if status
            [status, "Sucesso"]
        else
            [status, "Erro ao salvar."]
        end
    end
end
