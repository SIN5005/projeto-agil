# coding: utf-8
class LoginController < ApplicationController
  def index
  end
  
  def login
    @email = params[:email]
    @passwd = params[:passwd]

    if !@email || @email.length == 0 || ! @passwd || @passwd.length == 0
      flash[:alert] = "Credenciais inválidas."
      redirect_to action: index
      return
    end
    query = <<-SQL
        SELECT (PASSWORD = CRYPT(%s, PASSWORD)) AS MATCH, ID FROM USERS WHERE
        EMAIL = %s
    SQL
    
    @success = false
    result = User.find_by_sql(query % [User.connection.quote(@passwd), User.connection.quote(@email)])
    unless result.empty?
      result.each do |r|
        count_attempts(r.id)
        if r.id && (!r.match)
          flash[:alert] = "Combinação de e-mail e senha inválida."
        elsif r.id && r.match
          @success = true
        end
        if register_session(id=r.id)
          login_params = { users_id: r.id, success: @success}
          Login.new(login_params).save
        else
          @success = false
          flash[:alert] = "Erro ao registrar sessão"
        end
      end
    else
      flash[:alert] = "Usuário não cadastrado."
    end
    if @success
      redirect_to action: index
      return
    else
      redirect_to action: index
      return
    end
  end

  def register_session(id=nil)
    @status = false
    if id.present?
      user = User.find(id=id)
      if user.present?
        session[:user] = User.find(id=id)
        @status = true
      end
    end
    return @status
  end

  def count_attempts(users_id, format=:int)
    @logins = Login.where(users_id: users_id, success: false, created_at: (Time.now - 5.minutes)..Time.now).count
    print "\n\n!!!"
    print @logins
    print "\n\n"
    if @logins > 4
      User.update(locked: true)
    end
  end
end
