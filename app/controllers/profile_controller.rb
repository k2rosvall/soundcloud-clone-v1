class ProfileController < ApplicationController
  def show
    @user = User.find_by(display_name: params[:display_name])
  end
end
