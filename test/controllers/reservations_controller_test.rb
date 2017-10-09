require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @user = users(:one)
    @user.save
    log_in_as(@user)
    @car = cars(:one)
    @car.save
    @reservation = reservations(:one)
    @reservation.save
  end
  
  test "should get index" do
    get reservations_url
    assert_response :success
  end
  
  # test "should get new" do
  #   get new_reservation_url
  #   assert_response :success
  # end
  
  test "should show reservaiton" do
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end
  
end
