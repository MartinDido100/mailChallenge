class Mail < ApplicationRecord
  validates :content, presence: true
  validates :senderId, presence: true
  validates :receiverId, presence: true

  belongs_to :sender
  belongs_to :receiver
end
