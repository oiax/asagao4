require 'test_helper'

class Admin::TopControllerTest < ActionController::TestCase
  test "index for a common member" do
    login_as("taro")
    get :index
    assert_template "errors/forbidden"
  end

  test "index for an admin" do
    login_as("jiro", true)
    get :index
    assert_template "admin/top/index"
  end
end
