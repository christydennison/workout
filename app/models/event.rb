class Event < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  validates :title, presence: true 
  validates_time :time, on_or_after: lambda { Time.now }, on_or_after_message: 
      'You can\'t schedule something in the past!'
  validates_date :date, on_or_after: lambda { Time.now }, on_or_after_message: 
      'You can\'t schedule something in the past!'
  validates :place, presence: true
  
  def add_membership current_user
    current_membership = memberships.find_by_user_id current_user.id
    unless current_membership      
      # Create a new membership built from the user side
      current_membership = current_user.memberships.build user_id: 
          current_user.id, event_id: id
          
      # And add the membership to the event's array of memberships as well
      memberships << current_membership
    end
    current_membership
  end

end
