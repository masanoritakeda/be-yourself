class SearchsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).search(params[:search]).page(params[:page]).per(20)
    @count = @posts.count
  end
end
