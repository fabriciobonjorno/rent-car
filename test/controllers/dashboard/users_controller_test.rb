require 'test_helper'

class Dashboard::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dashboard_users_home_url
    assert_response :success
  end

end
