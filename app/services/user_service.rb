class UserService
  def getUser(id)
    User.find!(id)
  end

  def updateUser(user, params)
    user.update!(params)
    user
  end

  def deleteUser(user)
    user.destroy
  end

  def confirmEmail(user)
    user.update!(confirmed: true, confirm_email_token: nil)
  end

  def findByToken(token)
    User.find_by!(confirm_email_token: token)
  end

end