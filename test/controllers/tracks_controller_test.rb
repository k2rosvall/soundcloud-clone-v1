# frozen_string_literal: true

require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @track = tracks(:one)
  end

  test 'should get index' do
    get tracks_url
    assert_response :success
  end

  test 'should show track' do
    get track_url(@track)
    assert_response :success
  end
end
