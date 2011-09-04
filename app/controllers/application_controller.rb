class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  helper_method :current_user
  def current_user 
    logger.debug("user_id: #{session[:user_id]}")
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user=(user)
    @current_user = user
    session[:user_id] = (user ? user.id : nil)
    logger.debug("user_id set to: #{session[:user_id]}")
  end
  
end
