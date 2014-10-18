class User < ActiveRecord::Base
  acts_as_voter
  
  belongs_to :profession
  has_many :lists
end
