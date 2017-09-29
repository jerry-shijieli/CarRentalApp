class PickupCheckJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    reservation_id = args[0]
    reservation = Reservation.find(reservation_id)
    if reservation.reservationStatus == "Awaiting"
      reservation.update_attribute(:reservationStatus, "Cancel")
      car = Car.find_by_id(reservation.car_id)
      car.update_attribute(:status, "Available")
    end
  end
end