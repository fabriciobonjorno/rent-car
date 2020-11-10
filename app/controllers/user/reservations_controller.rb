class User::ReservationsController < UserController
  before_action :set_reservations, only: %i[edit update destroy]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    if @reservation.save
      car = Car.where(id: @reservation.car_id)
      car.update(rented: true)
      redirect_to user_clients_path, notice: "#{@reservation.id} feita com sucesso!"
    else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update_rented
    @car = Car.update(rented: true)
  end

  def update
    if @reservation.update(reservations_params)
      redirect_to user_clients_path, notice: "#{@reservation.id} atualizada com sucesso!"
    else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @reservation.destroy
      car = Car.where(id: @reservation.car_id)
      car.update(rented: false)
      redirect_to user_clients_path, notice: "#{@reservation.id} excluida com sucesso!"
    else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_reservations
    @reservation = Reservation.find(params[:id])
  end

  def reservations_params
    params.require(:reservation).permit(:date_start, :date_end, :car_id).merge(client_id: current_client.id)
  end
end
