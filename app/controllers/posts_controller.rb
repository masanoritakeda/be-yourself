class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy, :edit]
 
  def index 
    @posts = Post.order(id: :desc).page(params[:page]).per(20)
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
     
    if @post.save
      redirect_to controller: :toppages, action: :index
    else 
      render :new
    end 
  end

  def destroy
  end
  
  
  def search 
    @posts = Post.search(params[:search])
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :image, :title, :image_cache).merge(user_id: params[:user_id])
  end 
end
