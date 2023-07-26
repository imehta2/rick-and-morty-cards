require "test_helper"

class Admin::AboutUsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_about_us_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_about_us_update_url
    assert_response :success
  end
end
