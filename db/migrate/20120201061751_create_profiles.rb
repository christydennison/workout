class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :course
      t.string :bio
      t.boolean :visible
      t.integer :user_id
      t.timestamps
    end
  end
end
