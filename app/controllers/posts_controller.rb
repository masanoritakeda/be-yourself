class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy, :edit]
 
  def index 
    @posts = Post.order(id: :desc).page(params[:page]).per(2)
  end 
  
  def show 
    @post = Post.find_by(id: params[:id])
  end 
  
  def new
    @post = Post.new
    
    unless logged_in?
      redirect_to login_url
    end 
  end

  def create
    @post = current_user.posts.build(post_params)
     
    if @post.save!
     redirect_to @post
    else 
      render :new
    end 
  end

  def destroy
  end
  
  
  def search 
    @posts = Post.search(params[:search])
  end
  
  def self.category(category_id)
  if search
　  Post.where(category_id: category_id)
　 else
　  Post.all
　 end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :image, :title, :image_cache, :place, :category_id).merge(user_id: params[:user_id])
  end 
end
