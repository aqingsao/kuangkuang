class ApplicationController < ActionController::Base
  # protect_from_forgery

  def login
  	redirect_to "/"
  end

  def logout
  	redirect_to "/"
  end
end
