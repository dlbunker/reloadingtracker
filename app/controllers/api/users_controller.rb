class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_api_user!

  respond_to :json

  def show
    respond_with(@user)
  end

  private
  def set_user
    @user = User.find(current_api_user.id)
  end

end
