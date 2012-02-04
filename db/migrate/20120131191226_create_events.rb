class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :place
      t.text :description
      t.integer :owner

      t.timestamps
    end
  end
end
