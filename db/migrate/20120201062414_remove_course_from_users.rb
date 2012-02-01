class RemoveCourseFromUsers < ActiveRecord::Migration
  def up
    remove_column :Users, :course
  end

  def down
    add_column :Users, :course
  end
end
