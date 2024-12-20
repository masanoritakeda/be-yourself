class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :introduce, length: {maximum: 255 }
    validates :image, presence: true
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
    validates :password, presence: true, length: { minimum: 5 }
    has_secure_password
    mount_uploader :image, ImageUploader
    has_many :posts, dependent: :destroy
end
