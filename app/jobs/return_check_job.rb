class ReturnCheckJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    reservation_id = args[0]
    reservation = Reservation.find(reservation_id)
    if reservation.reservationStatus == "Active"
      reservation.update_attribute(:returnTime, Time.now)
      reservation.update_attribute(:reservationStatus, "Complete")
      car = Car.find(reservation.car_id)
      user = User.find(reservation.user_id)
      notice = "You are late to return the car"
      car.update_attribute(:status, "Available")
      user.update_attribute(:available, true)
      user.update_attribute(:notification, notice)
      
      # send email notification if someone is waiting
      Waitinglist.where({car_id: car.id, status: "Awaiting"}).find_each do |wait|
        UserMailer.car_available(User.find(wait.user_id), Car.find(wait.car_id)).deliver
        wait.update_attribute(:status, "Complete")
      end
      
      # calculate charge
      price = car.hourlyRentalRate
      hold_time = (reservation.returnTime - reservation.pickUpTime)/3600.0 # convert to hours
      charge = user.rentalCharge + price*hold_time
      user.update_attribute(:rentalCharge, charge) 
      # user.update_attribute(:notification, "You have pending charge!")
      
    end
  end
end
