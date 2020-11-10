class Dashboard::CarsController < DashboardController
  before_action :set_cars, only: %i[edit update destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(cars_params.merge(rented: false))
    if @car.save
      redirect_to dashboard_cars_path, notice: "#{@car.model} cadastrado com sucesso!"
    else
      flash.now[:alert] = @car.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @car.update(cars_params)
      redirect_to dashboard_cars_path, notice: "#{@car.model} atualizado com sucesso!"
    else
      flash.now[:alert] = @car.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    if @car.destroy
      redirect_to dashboard_cars_path, notice: "#{@car.model} excluido com sucesso!"
    else
      flash.now[:alert] = @car.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def set_cars
    @car = Car.find(params[:id])
  end

  def cars_params
    params.require(:car).permit(:model, :brand, :board, :model_year, :manufacture_year, :rented)
  end
end
