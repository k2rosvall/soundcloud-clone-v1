# frozen_string_literal: true

class UsersController < ActionController::Base
  def tracks
    @user = User.find(params[:id])
    @tracks = @user.tracks
  end
end
