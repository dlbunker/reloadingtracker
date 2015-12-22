class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :name
      t.string :caliber
      t.string :primer
      t.string :bullet
      t.string :powder
      t.decimal :charge
      t.decimal :trim
      t.decimal :oal
      t.decimal :velocity
      t.text :notes
      t.datetime :load_date
      t.integer :user_id

      t.timestamps
    end

    add_index :loads, :user_id
  end
end
