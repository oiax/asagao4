require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "login and logout" do
    member = FactoryGirl.create(:member, name: "taro",
      password: "happy", password_confirmation: "happy")

    post "/session", name: "taro", password: "happy"
    assert_redirected_to "/"
    assert_equal member.id, session[:member_id]

    follow_redirect!
    assert_select "table#login_form", false
    assert_select "div#header p.member", /taroさん/

    delete "/session"
    assert_redirected_to "/"
    assert_nil session[:member_id]

    follow_redirect!
    assert_select "table#login_form"
    assert_select "div#header p.member", false
  end
end
