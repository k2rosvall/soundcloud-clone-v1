# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it is not valid without first_name' do
    user = User.new

    refute user.valid?
    assert_equal user.errors.messages[:first_name].first, "can't be blank"
  end

  test 'it is not valid without last_name' do
    user = User.new

    refute user.valid?
    assert_equal user.errors.messages[:last_name].first, "can't be blank"
  end

  test 'it is not valid without email' do
    user = User.new

    refute user.valid?
    assert_equal user.errors.messages[:email].first, "can't be blank"
  end

  test 'it is not valid without password' do
    user = User.new

    refute user.valid?
    assert_equal user.errors.messages[:password].first, "can't be blank"
  end

  test "bio can't be longer than 255 characters" do
    user = User.new
    user.bio = 'Lorem ipsum dolor sit amet, nonummy ligula volutpat hac integer nonummy.
                Suspendisse ultricies, congue etiam tellus, erat libero, nulla eleifend, mauris pellentesque.
                Suspendisse integer praesent vel, integer gravida mauris, fringilla vehicula lacinia non'

    refute user.valid?
    assert_equal user.errors.messages[:bio].first, 'is too long (maximum is 255 characters)'
  end
end
