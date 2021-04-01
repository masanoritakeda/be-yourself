class SearchsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).search(params[:search]).page(params[:page]).per(15)
    @count = @posts.count
    
    
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @posts = @category.posts.order(id: :desc).all.page(params[:page]).per(15)
    else
      # 投稿すべてを取得
      @posts = Post.order(created_at: :desc).all.page(params[:page]).per(15)
    end
  end
end
