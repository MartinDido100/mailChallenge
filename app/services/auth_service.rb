class AuthService 

  def register(signUpData)
    @user = User.create(signUpData)
    if @user.save
      return @user
    else
      raise StandardError.new(@user.errors.full_messages.join(', '))
    end
  end

end