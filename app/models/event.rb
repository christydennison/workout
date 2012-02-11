class Event < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  validates :title, presence: true 
  validates :time, presence: true
  validates :date, presence: true
  validates :place, presence: true
  
  def add_membership user_id
    current_membership = memberships.find_by_user_id user_id
    unless current_membership
      current_user = User.find_by_user_id user_id  
      
      # Create a new membership built from the user side
      current_membership = current_user.memberships.build user_id: user_id, 
          event_id: @event
          
      # And add the membership to the event's array of memberships as well
      @event.memberships << current_membership
    end
    current_membership
  end
  
end
