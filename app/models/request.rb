class Request < ApplicationRecord
  belongs_to :user
  before_save { self.email = email.downcase }
  
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :size, presence: true
end
