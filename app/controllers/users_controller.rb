class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:show, :edit]}
  before_action :logged_out,{only:[:new, :create]}
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録完了"
      redirect_to login_path
    else
      flash[:danger] = "登録失敗"
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: current_user.id)
    
    @total_time = current_user.calendars.pluck(:learning_time).sum
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
