class User < ApplicationRecord
    before_save { self.email = email.downcase }

    has_secure_password

    has_many :carpools, dependent: :destroy
    has_many :housings, dependent: :destroy

    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: { minimum: 1, maximum: 25 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
end