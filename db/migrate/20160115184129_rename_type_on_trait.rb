class RenameTypeOnTrait < ActiveRecord::Migration
  def change
    rename_column :traits, :type, :attr_name
  end
end
