# coding: utf-8
class LoginController < ApplicationController
  def index
  end
  
  def login
    @email = params[:email]
    @passwd = params[:passwd]

    if !@email.present? or !@passwd.present?
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
      redirect_to action: 'index'
      return
    else
      redirect_to action: 'index'
      return
    end
  end

  def forgot
  end

  def send_mail
    @success = false
    
    if params[:email].present?
      email = params[:email]
      @user = User.find_by email: email
      if @user.present?
        @success = true
        @token = Array.new(rand(25..79)){[*"A".."Z", *"0".."9"].sample}.join
        @active = true
        clear_tokens(user=@user)
        RecoverPassword.new(user_id: @user.id, token: @token, active: true).save
        RecoverMailer.forgot(user=@user, token=@token).deliver_later
        flash[:notice] = "E-mail enviado. Caso não receba dentro de segundos, repita o processo."
      else
        flash[:alert] = "E-mail não encontrado."
      end
    else
      flash[:alert] = "Informe o e-mail cadastrado."
    end
    if  @success
      redirect_to action: 'index'
    else
      redirect_to action: 'forgot'
    end
  end

  def clear_tokens(user)
    RecoverPassword.where(user_id: user.id, active: true).find_each do |token|
      token.active = false
      token.save
    end
  end

  def new_password
  end
  
  def set_password
    @success = false
    @passwd_len = 7
    if params[:password].present? and params[:password2].present? and params[:token].present?
      passwd = params[:password]
      passwd_conf = params[:password2]
      token = params[:token]
      if passwd == passwd_conf && passwd.length >= @passwd_len
        @recover = RecoverPassword.find_by token: token
        if @recover.present?
          @success = true
          @user = User.find(@recover.user_id)
          @recover.active = false
          @recover.save
          encrypted_password = User.connection.select_all("SELECT crypt(%s, gen_salt('bf')) AS PASSWORD" % [User.connection.quote(passwd)]).to_hash.first
          @user.password = encrypted_password['password']
          @user.save
          flash[:notice] = "Senha redefinida com sucesso."
        else
          flash[:alert] = "Token não encontrado. Por favor, repita o processo de recuperação de senha."
        end
      else
        if passwd.length < 7
          flash[:alert] = "A nova senha deve conter pelo menos #{@passwd_len} caracteres."
        else
          flash[:alert] = "A nova senha e a confirmação devem ser iguais."
        end
      end
    else
      if not params[:token]
        flash[:alert] = "Token inválido. Repita o processo de recuperação de senha."
      else
        flash[:alert] = "Todos os campos devem ser preenchidos."
      end
    end
    if @success
      redirect_to controller: 'welcome', action: 'index'
    else
      redirect_to action: 'new_password', token: params[:token]
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
