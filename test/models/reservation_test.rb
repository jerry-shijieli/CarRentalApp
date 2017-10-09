require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @reservation = Reservation.new(checkOutTime: "2017-10-04 20:11:10 -400",
              pickUpTime: "2017-10-04 20:21:10 -400",
              expectedReturnTime: "2017-10-04 23:11:10 -400",
              returnTime: "2017-10-04 23:01:10 -400",
              reservationStatus: "Complete",
              user_id: 980190962,
              car_id: 980190962)
  end
  
  test "time should be in sequence" do
    assert @reservation.checkOutTime < @reservation.expectedReturnTime
  end
  
end
