class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ransack_search
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def ransack_search
    @q = Entry.ransack(params[:q])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :about, :web, :address, :industry, :sns, :image, :introduce, :gender, :education, :atschool, :skills])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about, :web, :address, :industry, :sns, :image,  :introduce, :gender, :education, :atschool, :skills])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :about, :web, :address, :industry, :sns, :image,  :introduce, :gender, :education, :atschool, :skills])
  end
end
