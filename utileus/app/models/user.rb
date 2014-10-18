class User < ActiveRecord::Base
  acts_as_votable
  has_and_belongs_to_many :professions

  has_many :lists
  has_many :votes
  has_many :apps, through: :lists
  has_many :reviews, through: :apps
end
