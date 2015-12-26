class Api::CalibersController < ApplicationController
  respond_to :json

  def index
    @calibers = Caliber.all
    respond_with(@calibers)
  end

  def show
    respond_with(@caliber)
  end

end
