class AuthService 

  def register(signUpData)
    User.create!(signUpData)
  end

end