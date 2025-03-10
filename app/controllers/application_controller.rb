# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit({ roles: [] }, :first_name, :last_name, :email, :password, :password_confirmation, :display_name, :bio, :followers, :following, :tracks, :profile_url, :city, :country, :avatar)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        { roles: [] },
        :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :display_name, :bio, :followers, :following, :tracks, :profile_id, :city, :country, :avatar
      )
    end
  end
end
