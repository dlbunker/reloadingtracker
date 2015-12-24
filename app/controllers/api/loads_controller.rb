class Api::LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_api_user!

  respond_to :json

  def index
    @loads = Load.all
    respond_with(@loads)
  end

  def show
    respond_with(@load)
  end

  def new
    @load = Load.new
    respond_with(@load)
  end

  def edit
  end

  def create
    @load = Load.new(load_params)
    @load.save
    respond_with(@load, location: api_load_url(@load))
  end

  def update
    @load.update(load_params)
    respond_with(@load)
  end

  def destroy
    @load.destroy
    head :no_content
    # respond_with(@load)
  end

  private
    def set_load
      @load = Load.find(params[:id])
    end

    def load_params
      params.require(:load).permit(:name, :caliber, :primer, :bullet, :powder, :charge, :trim, :oal, :velocity, :notes, :load_date, :user_id)
    end
end
