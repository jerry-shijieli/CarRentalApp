require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:one)
    log_in_as(@user)
    @car = cars(:one)
  end
  
  test "should get index" do
    get cars_url
    assert_response :success
  end
  
  test "should get new" do
    get cars_new_url
    assert_response :success
  end
  
  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

end
