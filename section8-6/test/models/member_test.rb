require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "factory girl" do
    member = FactoryGirl.create(:member)
    assert_equal "Yamada Taro", member.full_name
  end

  test "authenticate" do
    member = FactoryGirl.create(:member, name: "taro",
      password: "happy", password_confirmation: "happy")
    assert_nil Member.authenticate("taro", "lucky")
    assert_equal member, Member.authenticate("taro", "happy")
  end
end
