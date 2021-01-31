class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit,:update]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
     name: params[:name],
     email: params[:email],
     image: "a.png" 
      )
    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました。"
      redirect_to @user
    else
      render :new
    end
  end 
    
  def edit
   @user = User.find(params[:id])
   
  end 
    
  def update 
    @user = User.find(params[:id])
      
    if current_user == @user
      if @user.update(user_params)

        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else 
        flash.now[:damger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end 
    else 
      redirect_to root_url
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image)
  end 
end
