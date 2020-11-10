class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :car

  scope :reservation_true, -> { where(reservation: false) }
end
