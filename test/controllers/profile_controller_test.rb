# frozen_string_literal: true

require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test 'test_show' do
    get profile_path('user1')
    assert_response :success
  end

  test 'invalid_user' do
    get profile_path('invalid')
    assert_redirected_to root_url
  end
end
