class List < ActiveRecord::Base
	belongs_to :user
	has_many :apps
	validates :name, presence: true
	acts_as_votable
end