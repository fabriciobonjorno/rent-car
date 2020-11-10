class HomeController < ApplicationController
  def index
    @cars = Car.rented_false
  end
end
