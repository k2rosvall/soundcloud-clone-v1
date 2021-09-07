# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    @user = find_user
  end

  private

  def find_user
    user = User.find_by(profile_id: params[:profile_id])
    redirect_to root_url, notice: "The user #{params[:profile_id]} cannot be found" if user.nil?

    user
  end
end
