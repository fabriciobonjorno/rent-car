require 'test_helper'

class User::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get user_clients_home_url
    assert_response :success
  end

end
