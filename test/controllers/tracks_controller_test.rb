# frozen_string_literal: true

require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @track = tracks(:one)
  end

  test 'should get edit' do
    sign_in users(:one)
    get edit_track_url(@track)
    assert_response :success
  end

  test 'should create track' do
    sign_in users(:one)
    get new_track_url
    assert_response :success
  end
end
