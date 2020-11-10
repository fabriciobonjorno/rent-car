class Dashboard::UsersController < DashboardController
  before_action :set_users, only: %i[edit update destroy]
  before_action :allow_without_password, only: [:update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to dashboard_users_path, notice: "#{@user.name} cadastrado com sucesso!"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(users_params)
      redirect_to dashboard_users_path, notice: "#{@user.name} atualizado com sucesso!"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to dashboard_users_path, notice: "#{@user.name} excluido com sucesso!"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
  end

  # remove o input da validação do devise
  def allow_without_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
