require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get create_user" do
    get admin_create_user_url
    assert_response :success
  end

  test "should get edit_user" do
    get admin_edit_user_url
    assert_response :success
  end

  test "should get show_user" do
    get admin_show_user_url
    assert_response :success
  end
end
