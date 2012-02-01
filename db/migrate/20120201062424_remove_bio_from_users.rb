class RemoveBioFromUsers < ActiveRecord::Migration
  def up
    remove_column :Users, :bio
  end

  def down
    add_column :Users, :bio
  end
end
