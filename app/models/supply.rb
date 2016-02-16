class Supply < ActiveRecord::Base
  belongs_to :user
  belongs_to :product, :polymorphic => true

  attr_accessor :trans_type
end
