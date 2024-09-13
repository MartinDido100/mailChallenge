class UserSerializer < ApplicationSerializer
  def initialize(users)
    @users = users
  end

  def as_json
    @users.map do |user|
      serialize_stats(user)
    end
  end 
  
  def model_as_json
    puts @users
    serialize_to_json(@users)
  end

  private
    def serialize_to_json(user)
      {
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username,
        created_at: user.created_at,
      }
    end

    def serialize_stats(user)
      {
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username,
        created_at: user.created_at,
        emails_count: user.emailscount
      }
    end

end
