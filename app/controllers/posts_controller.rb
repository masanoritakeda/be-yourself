class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy, :edit]
  
  def new
    @post = Post.new
    
  end
 

  def create
     @post = current_user.posts.build(post_params)
     
    if @post.save
      redirect_to root_url
    else 
      render :new
    end 
  end

  def destroy
  end
  
 
  
  private
  
  def post_params
    params.require(:post).permit(:content, :image, :title, :image_cache)
  end 
  
end
