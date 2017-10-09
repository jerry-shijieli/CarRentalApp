class ReturnCheckJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    reservation_id = args[0]
    reservation = Reservation.find(reservation_id)
    if reservation.reservationStatus == "Active"
      reservation.update_attribute(:reservationStatus, "Complete")
      car = Car.find(reservation.car_id)
      user = User.find(reservation.user_id)
      notice = "You are late to return the car"
      car.update_attribute(:status, "Available")
      user.update_attribute(:notification, notice)
    end
  end
end
