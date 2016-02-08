class AddActiveToTraits < ActiveRecord::Migration
  def change
    add_column :traits, :active, :boolean, :default => true, :null => false, :index => true
  end
end
