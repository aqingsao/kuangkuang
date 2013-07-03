class ApplicationController < ActionController::Base
  # protect_from_forgery

  def login
    session[:user_id] = params[:user]
    cookies[:session_id] = session[:session_id]
  	logger.warn "User #{session[:user_id]} logged in successfully with session id: #{session[:session_id]}"
  	# redirect_to "/"
  end

  def logout
  	logger.warn "User #{session[:user_id]} logged out successfully."
    reset_session
    cookies.delete :session_id

  	redirect_to "/"
  end

  def index
  end
end