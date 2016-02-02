class Api::TraitsController < ApplicationController
  before_action :set_trait, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_api_user!
  before_action :ensure_admin!, except: [:index]

  respond_to :json

  def index
    search
  end

  def search
    if "#{params[:options]}" == 'true'
      @traits = type_options
    else
      @traits = Trait.all

      unless "#{params[:type]}".blank?
        @traits = Trait.where(:attr_name => params[:type]) if Trait::TYPES.include? params[:type]
      end
    end

    respond_with(@traits)
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
    @trait.destroy
    head :no_content
  end

  private
  def set_trait
    @trait = Trait.find(params[:id])
  end

  def trait_params
    params.require(:trait).permit(:name, :attr_name)
  end

  def type_options
    options = Array.new

    Trait::TYPES.each do |type|
      options << Trait.new(:attr_name => type, :name => "#{type}".capitalize)
    end

    options
  end

end
