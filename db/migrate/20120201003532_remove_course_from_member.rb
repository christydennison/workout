class RemoveCourseFromMember < ActiveRecord::Migration
  def up
    remove_column :Members, :course
  end

  def down
    add_column :Members, :course
  end
end
