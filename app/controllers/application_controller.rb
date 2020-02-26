class ApplicationController < ActionController::Base
  # sign_up時に必要なパラメータを定義できる
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number ])
  end
end
