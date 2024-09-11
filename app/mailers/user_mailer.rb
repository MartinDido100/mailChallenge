class UserMailer < ApplicationMailer
  def confirm(user)
    @user = user
    @url = "http://localhost:3000/api/user/confirm"

    mail to: @user.email, subject: 'Confirm your email'
  end
end
