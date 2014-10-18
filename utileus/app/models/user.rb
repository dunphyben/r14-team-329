class User < ActiveRecord::Base
  acts_as_voter
  
  has_and_belongs_to_many :professions

  has_many :lists
  has_many :votes
end
