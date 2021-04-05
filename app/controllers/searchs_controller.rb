class SearchsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).search(params[:search]).page(params[:page]).per(15)
    @count = @posts.count
  end
end
