class RemoveNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :Users, :name
  end

  def down
    add_column :Users, :name
  end
end
