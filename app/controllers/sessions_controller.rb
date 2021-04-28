class SessionsController < ApplicationController
  before_action :log_out,{only:[:new]}
  
  def new
  end
  
  def create
    user = User.find_by(user_email_params)
    if user && user.authenticate(user_password_params[:password])
      log_in user
      flash[:success] = "ログイン成功"
      redirect_to calendars_path
    else
      flash[:danger] = "ログイン失敗"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  # ログイン情報を保持
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def user_email_params
    params.require(:session).permit(:email)
  end
  
  def user_password_params
    params.require(:session).permit(:password)
  end



end
