class Api::LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]
  before_action :build_traits, only: [:create, :update]
  before_action :authenticate_api_user!

  respond_to :json

  def index
    @loads = Load.all.where(:user_id => current_api_user.id)
    @calibers = Caliber.all
    respond_with(@loads)
  end

  def show
    render :json => @load.to_json(:include => [:caliber, :primer, :bullet, :powder])
  end

  def new
    @load = Load.new
    respond_with(@load)
  end

  def edit
  end

  def create
    @load = Load.new(load_params)
    @load.user = current_api_user
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
    params.require(:load).permit(:name, :caliber_id, :primer_id, :bullet_id, :powder_id, :charge, :trim, :oal, :velocity, :notes, :load_date, :user_id, :qty)
  end

  def build_traits
    Trait::TYPES.each do |type|
      traitId = params["#{type}_id"]
      traitValue = params[type]

      if (traitId.blank? || traitId == 0) && !"#{traitValue}".blank?
        trait = Trait.create! :attr_name => type, :name => traitValue
        params[:load]["#{type}_id"] = trait.id
      end
    end
  end
end
