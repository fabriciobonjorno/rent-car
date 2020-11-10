class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :car
  validate :data

  def data
    if date_start < Time.now
      errors[:base] << 'Você não pode selecionar uma data menor que hoje'
    elsif date_end < date_start
      errors[:base] << 'Você não pode selecionar uma data menor que data de inicio'
    end
  end
  
end
