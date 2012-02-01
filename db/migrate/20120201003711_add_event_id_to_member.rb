class AddEventIdToMember < ActiveRecord::Migration
  def change
    add_column :Members, :event_id, :integer 
  end
end
