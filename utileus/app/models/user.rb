class User < ActiveRecord::Base
  has_and_belongs_to_many :professions
  has_many :lists
  has_many :votes
end
