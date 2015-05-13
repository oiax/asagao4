require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def setup
    login_as("taro")
  end

  test "index" do
    logout
    5.times { FactoryGirl.create(:article) }
    get :index
    assert_response :success
    assert_equal 5, assigns(:articles).count
  end

  test "show" do
    logout
    article = FactoryGirl.create(:article, expired_at: nil)
    get :show, id: article
    assert_response :success
  end
end
