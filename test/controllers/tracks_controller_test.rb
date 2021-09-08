# frozen_string_literal: true

require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @track = tracks(:one)
  end
end
