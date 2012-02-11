class User < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :events, through: :memberships
  has_one :profile
  
  validates :athena, presence: true, uniqueness: true
  has_secure_password
  
end
