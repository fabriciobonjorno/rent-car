class Car < ApplicationRecord
  scope :rented_false, -> { where(rented: false) }
end
