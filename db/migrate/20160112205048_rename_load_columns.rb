class RenameLoadColumns < ActiveRecord::Migration
  def change
    
    # rename_column :loads, :primer, :primer_id
    change_column :loads, :primer_id, :integer

    rename_column :loads, :bullet, :bullet_id
    change_column :loads, :bullet_id, :integer

    rename_column :loads, :powder, :powder_id
    change_column :loads, :powder_id, :integer
  end
end
