require "test_helper"

class AboutUsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get about_us_show_url
    assert_response :success
  end
end
