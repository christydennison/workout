class Event < ActiveRecord::Base
  has_many :members, dependent: :destroy
  validates :title, presence: true 
  validates :time, presence: true
  validates :date, presence: true
  validates :place, presence: true
end
