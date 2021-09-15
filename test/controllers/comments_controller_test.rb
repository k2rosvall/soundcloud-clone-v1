# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @track = tracks(:one)
    @comment = comments(:one)
  end

  test 'should create comment' do
    sign_in users(:one)
    post track_comments_path(@track), params: { comment: { content: 'comment' } }
    assert_redirected_to track_path(@track)
  end

  test 'should delete comment' do
    sign_in users(:one)
    delete track_comment_path(@track, @comment)
    assert_redirected_to track_path(@track)
  end
end
