class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :supply, :null => false, :index => true

      t.string :trans_type, :null => false, :index => true
      t.integer :qty, :null => false, :index => true, :default => 0

      t.timestamps
    end
  end
end
