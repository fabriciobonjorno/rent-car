class User::ReservationsController < UserController
  before_action :set_reservations, only: %i[edit update destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    if @reservation.save
      redirect_to user_reservations_path, notice: "#{@reservation.id} feita com sucesso!"
    else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservations_params)
      redirect_to user_reservations_path, notice: "#{@reservation.id} atualizada com sucesso!"
    else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @reservation.destroy
      redirect_to user_reservations_path, notice: "#{@reservation.id} excluida com sucesso!"
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
    params.require(:reservation).permit(:date_start, :date_end, :client_id, :car_id)
  end
end
