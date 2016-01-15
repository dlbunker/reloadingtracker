class Trait < ActiveRecord::Base

  TYPE_PRIMER = 'primer'
  TYPE_BULLET = 'bullet'
  TYPE_POWDER = 'powder'

  TYPES = [TYPE_PRIMER, TYPE_BULLET, TYPE_POWDER]

  has_many :loads

  validates_presence_of :attr_name, :name
  validates_uniqueness_of :attr_name, :scope => :name
end
