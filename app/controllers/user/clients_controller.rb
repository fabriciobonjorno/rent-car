class User::ClientsController < UserController
  before_action :set_clients, only: %i[edit update destroy]
  before_action :allow_without_password, only: [:update]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(clients_params)
    if @client.save
      redirect_to user_clients_path, notice: "#{@client.name} cadastrado com sucesso!"
    else
      flash.now[:alert] = @client.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(clients_params)
      redirect_to user_clients_path, notice: "#{@client.name} atualizado com sucesso!"
    else
      flash.now[:alert] = @client.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @client.destroy
      redirect_to user_clients_path, notice: "#{@client.name} excluido com sucesso!"
    else
      flash.now[:alert] = @client.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_clients
    @client = Client.find(params[:id])
  end

  def clients_params
    params.require(:client).permit(:name, :email, :password, :password_confirmation, :cpd)
  end

  # remove o input da validação do devise
  def allow_without_password
    if params[:client][:password].blank? && params[:client][:password_confirmation].blank?
      params[:client].delete(:password)
      params[:client].delete(:password_confirmation)
    end
  end
end
