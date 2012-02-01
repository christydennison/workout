class RemoveNameFromMember < ActiveRecord::Migration
  def up
    remove_column :Members, :name
  end

  def down
    add_column :Members, :name
  end
end
