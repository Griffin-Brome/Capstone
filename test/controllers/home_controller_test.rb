# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get sign_up' do
    get home_sign_up_url
    assert_response :success
  end
end
