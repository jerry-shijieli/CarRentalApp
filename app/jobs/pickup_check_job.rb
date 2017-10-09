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
      user = User.find_by_id(reservation.user_id)
      user.update_attribute(:available, true)
      
      # send email notification if someone is waiting
      Waitinglist.where({car_id: car.id, status: "Awaiting"}).find_each do |wait|
        UserMailer.car_available(User.find(wait.user_id), Car.find(wait.car_id)).deliver
        wait.update_attribute(:status, "Complete")
      end
      
    end
  end
end