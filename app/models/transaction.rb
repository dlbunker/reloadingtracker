class Transaction < ActiveRecord::Base

  TRANS_TYPE_PLUS = 'plus'
  TRANS_TYPE_MINUS = 'minus'

  TRANS_TYPES = [TRANS_TYPE_PLUS, TRANS_TYPE_MINUS]

  belongs_to :supply
end
