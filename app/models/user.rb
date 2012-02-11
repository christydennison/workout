class User < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :events, through: :memberships
  has_one :profile
  
  validates :athena, presence: true
  validates_uniqueness_of :athena, case_sensitive: false
  has_secure_password
  
end
