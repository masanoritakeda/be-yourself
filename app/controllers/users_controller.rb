class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit,:update]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10).order('updated_at DESC')
  end

  def new 
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    
    if @user.save
      session[:user_id] = @user.id #ユーザー登録時にログイン状態にする
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      render :new
    end
  end
    
  def edit
   @user = User.find_by(id: params[:id])
  end 
    
  def update 
    @user = User.find_by(id: params[:id])
    
    if current_user == @user
      if @user.update(user_params)
        flash.now[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else 
        flash.now[:damger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end 
    end 
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image, :image_cache)
  end 
end