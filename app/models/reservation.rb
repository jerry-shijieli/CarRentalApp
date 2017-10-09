class Reservation < ApplicationRecord
    
  require 'date'
  enum reservationStatuses: [:Awaiting, :Active, :Complete, :Cancel]

  validates :reservationStatus, inclusion: {in: reservationStatuses}
  validates :checkOutTime, presence: true
  validates :expectedReturnTime, presence: true
  
  validate :orderTimeValidation
  
  def orderTimeValidation 
    if checkOutTime < Time.now || checkOutTime > Time.now + 7.days
      errors.add(:checkOutTime, "should within 7 days from now!")
    elsif expectedReturnTime < Time.now || expectedReturnTime > Time.now + 7.days
      errors.add(:expectedReturnTime, "should within 7 days from now!")
    elsif checkOutTime >= expectedReturnTime
      errors.add(:expectedReturnTime, "should be in the future of checkout time!")
    end 
  end
    
end
