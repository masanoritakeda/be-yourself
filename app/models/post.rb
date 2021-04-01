class Post < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true
  validates :image, presence: true
  validates :place, presence: true
  validates :user_id,presence: true
  mount_uploader :image, ImgUploader
  belongs_to :user, optional: true
  has_many :post_categories
  has_many :categories, through: :post_categories
  
  def self.search(search)
    if search
      Post.where(['title LIKE ? OR content LIKE ? OR place LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Post.all
    end
  end
  
  def self.category(category_id)
   if search
　  Post.where(category_id: category_id)
　 else
　  Post.all
　 end
  end
end
