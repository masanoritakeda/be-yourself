class Post < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true
  validates :image, presence: true
  mount_uploader :image, ImgUploader
  belongs_to :user
  validates :user_id, presence: true
end
