class AuthService 

  def register(signUpData)
    @roleId = Role.find_by(name: "user").id
    signUpData[:role_id] = @roleId
    User.create!(signUpData)
  end

end