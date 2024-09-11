class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password,length: { minimum: 6 }, presence: true, on: :create

  has_many :sent_mails
  has_many :received_mails
end
