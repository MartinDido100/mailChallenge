class Email < ApplicationRecord
  validates :body, presence: true
  validates :receiverId, presence: true

  belongs_to :sender, class_name: "User", foreign_key: "senderId"
  belongs_to :receiver, class_name: "User", foreign_key: "receiverId"
end
