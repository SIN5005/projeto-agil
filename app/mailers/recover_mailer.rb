class RecoverMailer < ApplicationMailer
  default from: 'recover@pluto.com.br'

  def forgot(user=nil, token=nil)
    success = false
    if user.present? and token.present?
      success = true
      @user = user
      url_base = 'http://localhost:3000/login/reset?token='
      @url = url_base + token
      mail(to: @user.email, subject: 'Troca de senha')
    end
    return success
  end
end
