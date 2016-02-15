class Load < ActiveRecord::Base
  after_save :updateSupplies

  validates_presence_of :name, :user

  belongs_to :user
  belongs_to :caliber
  belongs_to :primer
  belongs_to :bullet
  belongs_to :powder

  private

  def updateSupplies
    previous, current = self.qty_change
    supplies = [self.caliber, self.primer, self.bullet, self.powder]

    diff_amount = current - previous
    diff_type = Transaction::TRANS_TYPE_MINUS

    if diff_amount < 0
      diff_amount *= -1
      diff_type = Transaction::TRANS_TYPE_PLUS
    end

    supplies.each do |supply|
      supply = Supply.create_with(:onhand => 0, :cost => 0, :cost_qty => 0, :product_type => supply.class.name)
                   .find_or_create_by!(:user_id => self.user_id, :product_id => supply.id)

      Transaction.create! :supply_id => supply.id, :trans_type => diff_type, :qty => diff_amount
      onhand = ((diff_type == 'minus') ? supply.onhand - diff_amount : supply.onhand + diff_amount)

      supply.update! :onhand => onhand
    end
  end
end
