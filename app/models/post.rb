class Post < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true
  validates :image, presence: true
  mount_uploader :image, ImgUploader
  belongs_to :user, optional: true
  validates :user_id, presence: true
  
  def self.search(search)
    if search
      Post.where(['title LIKE ? OR content LIKE ?' , "%#{search}%", "%#{search}%"])
    else 
      Post.all
    end 
  end 
end
