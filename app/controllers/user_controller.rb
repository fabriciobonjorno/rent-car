class UserController < ApplicationController
  before_action :authenticate_client!
  layout "user"

  def index
  end
end
