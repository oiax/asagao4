ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  private
  # ログイン状態にする
  def login_as(name, admin = false)
    session[:member_id] = FactoryGirl.create(:member, name: name,
      administrator: admin)
  end

  # ログアウト状態にする
  def logout
    session.delete(:member_id)
  end

  # アップロードしたファイル
  def uploaded_file(fname, type)
    Rack::Test::UploadedFile.new(
      Rails.root.join("test/factories", fname), type)
  end
end
