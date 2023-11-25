require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should sign in" do
    post signin_path, params: {
      user: {
        tg_user_name: "artemaminov",
        tg_user_id: 345345345
      }
    }
    assert_response :success
  end
end
