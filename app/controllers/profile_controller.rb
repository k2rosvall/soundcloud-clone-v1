# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    @user = find_user
  end

  private
  
  def find_user
    user = User.find_by(display_name: params[:display_name])
    redirect_to root_url, notice: "User doesn't exist" if user.nil?

    user
  end
end
