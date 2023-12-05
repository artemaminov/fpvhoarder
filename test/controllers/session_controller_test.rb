require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get session_create_url
    assert_response :success
  end

  test "should get index" do
    get session_index_url
    assert_response :success
  end
end
