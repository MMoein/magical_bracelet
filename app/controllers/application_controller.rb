class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  acts_as_token_authentication_handler_for User, except: [:index1]
  protect_from_forgery with: :exception
  def about
  	render file: "/app/views/about"
  end

  def services
  	render file: "/app/views/services"
  end
end
