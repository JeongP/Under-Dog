class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'block.rb'
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: []
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :budget, :img])
  end

  
end
