class UserSerializer < ApplicationSerializer
  def initialize(user)
    @user = user
  end

  def as_json
    serialize_to_json(@user)
  end

  private
    def serialize_to_json(user)
      {
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username
      }
  end

end
