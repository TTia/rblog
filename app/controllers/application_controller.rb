class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
	  @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  end
end
