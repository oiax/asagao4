require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "index" do
    5.times { FactoryGirl.create(:article) }
    get :index
    assert_response :success
    assert_equal 5, assigns(:articles).count
  end

  test "show" do
    article = FactoryGirl.create(:article, expired_at: nil)
    get :show, id: article
    assert_response :success
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "edit" do
    article = FactoryGirl.create(:article)
    get :edit, id: article
    assert_response :success
  end

  test "create" do
    post :create, article: FactoryGirl.attributes_for(:article)
    article = Article.order(:id).last
    assert_redirected_to article
  end

  test "update" do
    article = FactoryGirl.create(:article)
    patch :update, id: article, article: FactoryGirl.attributes_for(:article)
    assert_redirected_to article
  end

  test "fail to create" do
    attrs = FactoryGirl.attributes_for(:article, title: "")
    post :create, article: attrs
    assert_response :success
    assert_template "new"
  end

  test "fail to update" do
    attrs = FactoryGirl.attributes_for(:article, body: "")
    article = FactoryGirl.create(:article)
    patch :update, id: article, article: attrs
    assert_response :success
    assert_template "edit"
  end

  test "destroy" do
    article = FactoryGirl.create(:article)
    delete :destroy, id: article
    assert_redirected_to :articles
    assert_raises(ActiveRecord::RecordNotFound) {
      Article.find(article.id) }
  end
end
