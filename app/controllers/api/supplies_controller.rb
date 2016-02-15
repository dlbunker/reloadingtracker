class Api::SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :adjust, :destroy]
  before_action :authenticate_api_user!

  respond_to :json

  def index
    @supplies = Supply.all.where(:user_id => current_api_user.id)
    respond_with(@supplies, :include => [:product])
  end

  def products
    @products = Hash.new

    trait = 'Caliber'
    @products[trait] = {:name => trait, :items => Array.new}

    Caliber.all.each do |caliber|
      @products[trait][:items] << {:id => caliber.id, :name => caliber.name}
    end

    Trait::TYPES.each do |trait|
      trait = "#{trait}".capitalize
      @products[trait] = {:name => trait, :items => Array.new}

      obj = Object.const_get trait
      obj.where(:active => true).each do |item|
        @products[trait][:items] << {:id => item.id, :name => item.name}
      end
    end

    respond_with(@products)
  end

  def trans_types
    @trans_types = Array.new

    Transaction::TRANS_TYPES.each do |type|
      @trans_types << {:id => type, :name => type.capitalize}
    end

    respond_with(@trans_types)
  end

  def show
    render :json => @supply.to_json(:include => [:product])
  end

  def new
    @supply = Supply.new
    respond_with(@supply)
  end

  def create
    @supply = Supply.new(supply_params)
    @supply.user = current_api_user
    @supply.save

    respond_with(@supply, location: api_load_url(@supply))
  end

  def edit
  end

  def update
    @supply.update(supply_params)
    respond_with(@supply)
  end

  def onhand
  end

  def adjust
    trans_type = params[:trans_type]
    qty = params[:qty].to_i

    Transaction.create! :supply_id => @supply.id, :trans_type => trans_type, :qty => qty

    onhand = ((trans_type == 'minus') ? @supply.onhand - qty : @supply.onhand + qty)
    @supply.update(:onhand => onhand)

    respond_with(@supply, location: api_load_url(@supply))
  end

  def destroy
    @supply.destroy
    head :no_content
  end

  private
  def set_supply
    @supply = Supply.find(params[:id])
  end

  def supply_params
    params.require(:supply).permit(:user_id, :product_type, :product_id, :cost, :cost_qty)
  end

end
