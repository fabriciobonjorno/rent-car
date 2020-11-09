class User::ReservationsController < UserController
  before_action :set_reservations, only: %i[edit update destroy]

  def index
    @resevartions = Reservation.all
  end

  def new
    @resevartion = Reservation.new
  end

  def create
    @resevartion = Reservation.new(reservations_params)
    if @reservation.save
      redirect_to user_resevations_path, notice: "#{@resevartion.id} feita com sucesso!"
    else
      flash.now[:alert] = @resevation.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @resevartion.update(reservations_params)
      redirect_to user_resevations_path, notice: "#{@resevartion.id} atualizada com sucesso!"
    else
      flash.now[:alert] = @resevation.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @resevartion.destroy
      redirect_to user_resevations_path, notice: "#{@resevartion.id} excluida com sucesso!"
    else
      flash.now[:alert] = @resevation.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_reservations
    @resevation = Reservation.find(params[:id])
  end

  def reservations_params
    params.require(:reservation).permit(:date_start, :date_end, :client_id, :car_id)
  end
end
