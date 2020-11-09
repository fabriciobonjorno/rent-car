require 'test_helper'

class Dashboard::CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dashboard_cars_home_url
    assert_response :success
  end

end
