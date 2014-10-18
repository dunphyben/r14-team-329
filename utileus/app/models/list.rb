class List < ActiveRecord::Base
	acts_as_votable
	
	belongs_to :user
	has_many :apps
	validates :name, presence: true
end