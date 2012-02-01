class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :athena
      t.string :name
      t.string :course
      t.text :bio

      t.timestamps
    end
  end
end
