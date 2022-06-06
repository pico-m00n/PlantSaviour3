require "test_helper"

class Public::EndUserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_end_user_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_end_user_edit_url
    assert_response :success
  end
end
