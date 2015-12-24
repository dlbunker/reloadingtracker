class CreateCalibers < ActiveRecord::Migration
  def change
    create_table :calibers do |t|
      t.string :name
      t.decimal :diameter

      t.timestamps null: false
    end
  end
end
