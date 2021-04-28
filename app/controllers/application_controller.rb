class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger


  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def authenticate_user
    if current_user == nil
      flash[:danger] = "ログインしてください"
      redirect_to root_path
    end
  end
  
  def  logged_out
    if current_user != nil
      flash[:danger] = "ログアウトしてください"
      redirect_to calendars_path
    end
  end
end
