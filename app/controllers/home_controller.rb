class HomeController < ApplicationController
  def index
    @cars = Car.all
    @reservation = Reservation.reservation_true
  end
end
