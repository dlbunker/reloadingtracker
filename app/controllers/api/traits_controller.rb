class Api::TraitsController < ApplicationController
  before_action :set_trait, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_api_user!
  before_action :ensure_admin!, except: [:index]

  respond_to :json

  def index
    @traits = Trait.all

    unless "#{params[:type]}".blank?
      obj = Object.const_get "#{params[:type]}".capitalize
      traits = obj.where(:active => true)

      @traits = Hash.new
      traits.each_with_index do |trait, index|
        @traits["#{trait.attr_name}_#{index}".to_sym] = trait
      end
    end

    respond_with(@traits)
  end

  def options
    # @options = Array.new
    #
    # Trait::TYPES.each do |type|
    #   @options << {:attr_name => type, :name => "#{type}".capitalize}
    # end
    #
    # respond_with(@options)

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

  def show
    respond_with(@trait)
  end

  def new
    @trait = Trait.new
    respond_with(@trait)
  end

  def create
    @trait = Trait.new(trait_params)
    @trait.save

    respond_with(@trait, location: api_load_url(@trait))
  end

  def edit
  end

  def update
    @trait.update(trait_params)
    respond_with(@trait)
  end

  def destroy
    @trait.update_attribute :active, !@trait.active?
    head :no_content
  end

  private
  def set_trait
    @trait = Trait.find(params[:id])
  end

  def trait_params
    params.require(:trait).permit(:name, :attr_name)
  end

end
