class AddColumnsToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :qty, :integer
    add_column :loads, :caliber_id, :integer
    add_index :loads, :caliber_id
  end
end
