require "test_helper"

class AddControllerTest < ActionDispatch::IntegrationTest
  test "should get modesl" do
    get add_modesl_url
    assert_response :success
  end
end
