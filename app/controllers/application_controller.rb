class ApplicationController < ActionController::Base
  # protect_from_forgery

  def login
    Rails.logger.level = 2   	 
  	logger.warn "User #{params[:user]} logged in successfully"
  	session[:user_id] = params[:user]
  	redirect_to "/"
  end

  def logout
  	logger.warn "User #{params[:user]} logged out"
  	session[:user_id] = nil
  	redirect_to "/"
  end
end