class UserMailer < ApplicationMailer
  def confirm(user)
    @url = "#{ENV['API_URL']}/user/confirm/#{user.confirm_email_token}"
    @user = user

    mail to: user.email, subject: 'Confirm your email'
  end

  def sendMail(email)
    @body = email.body
    @sender = email.sender.email
    mail to: email.receiver.email, subject: email.subject
  end
end
