class RemoveBioFromMember < ActiveRecord::Migration
  def up
    remove_column :Members, :bio
  end

  def down
    add_column :Members, :bio
  end
end
