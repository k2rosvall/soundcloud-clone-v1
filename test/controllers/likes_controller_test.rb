# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @track = tracks(:one)
    @like = likes(:one)
  end

  test 'should create like' do
    sign_in users(:one)
    post track_likes_path(@track)
    assert_redirected_to root_path
  end

  test 'should delete like' do
    sign_in users(:one)
    delete track_like_path(@track, @like)
    assert_redirected_to root_path
  end
end
