class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user ||= User.where(id: session[:user_id]).first
    end
  end
  helper_method :current_user
  
  def authenticate_user!
    unless current_user
      redirect_to boards_url, notice: 'You do not have access to this'
    end
  end  
end
