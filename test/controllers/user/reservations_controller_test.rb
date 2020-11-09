require 'test_helper'

class User::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get user_reservations_home_url
    assert_response :success
  end

end
