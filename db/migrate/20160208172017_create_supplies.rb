class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.references :user, :null => false
      t.references :product, :polymorphic => true, :index => true

      t.decimal :cost, :null => false, :default => 0, :precision => 2, :scale => 10
      t.integer :cost_qty, :null => false, :default => 1
      t.integer :onhand, :null => false, :default => 0, :index => true

      t.timestamps
    end
  end
end
