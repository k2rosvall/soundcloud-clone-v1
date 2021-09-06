# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  
  protected

  def after_update_path_for(resource)
    profile_path(resource.profile_id)
  end
  
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :display_name, :bio, :profile_id, :city, :country, :avatar)
  end
end
