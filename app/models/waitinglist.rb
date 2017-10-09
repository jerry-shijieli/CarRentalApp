class Waitinglist < ApplicationRecord
    enum waitStatus: [:Awaiting, :Complete, :Cancel]
    validates :status, inclusion: {in: waitStatuses}
end
