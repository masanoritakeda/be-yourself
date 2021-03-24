class SearchsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).search(params[:search]).page(params[:page]).per(20)
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @posts = @category.posts.order(id: :desc).all.page(params[:page]).per(20)
    else
      # 投稿すべてを取得
      @posts = Post.order(created_at: :desc).all.page(params[:page]).per(20)
    end
    @count = @posts.count
  end
end
