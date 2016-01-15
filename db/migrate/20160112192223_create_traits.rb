class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :type
      t.string :name

      t.timestamps
    end

    add_index :traits, :type
    add_index :traits, :name
    add_index :traits, [:type, :name], :unique => true
  end
end
