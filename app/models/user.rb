class User < ApplicationRecord

  before_create :generate_confirmation_token

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password,length: { minimum: 6 }, presence: true, on: :create

  has_many :emails, class_name: 'Email', foreign_key: 'senderId'
  has_many :received_mails, class_name: 'Email', foreign_key: 'receiverId'
  belongs_to :role, class_name: "Role", foreign_key: "role_id"

  private
    def generate_confirmation_token
      self.confirm_email_token = SecureRandom.urlsafe_base64.to_s
      puts self.confirm_email_token
    end

end
