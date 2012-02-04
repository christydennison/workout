class User < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :events, through: :members
  has_one :profiles
  
  validates :athena, presence: true, uniqueness: true
  has_secure_password
end
