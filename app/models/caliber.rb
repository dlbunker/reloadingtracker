class Caliber < ActiveRecord::Base
  has_many :loads
  has_many :supplies, :as => :product
end
