class Api::TraitsController < ApplicationController
  respond_to :json

  def index
    @traits = Trait.all

    unless "#{params[:type]}".blank?
      @traits = Trait.where(:attr_name => params[:type]) if Trait::TYPES.include? params[:type]
    end

    respond_with(@traits)
  end

  def show
    respond_with(@traits)
  end

end
