class PasswordMailer < ApplicationMailer
	default from: 'plutofinancialapp@gmail.com'

	def sample_email(user)
		@user = user
		mail(to: @user.email, subject: 'Recuperação de senha - Pluto')
	end
end
