require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test "index" do
    login_as("taro")
    get :index
    assert_response :success
  end

  test "index before login" do
    assert_raise(ApplicationController::Forbidden) { get :index }
  end
end
