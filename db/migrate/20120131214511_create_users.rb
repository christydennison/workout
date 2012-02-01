class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :athena
      t.string :name
      t.string :password_digest
      t.string :course
      t.text :bio

      t.timestamps
    end
  end
end
