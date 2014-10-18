class App < ActiveRecord::Base
	acts_as_votable
	
	belongs_to :list
	has_many :reviews
end