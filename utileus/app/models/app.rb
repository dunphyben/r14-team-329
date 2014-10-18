class App < ActiveRecord::Base
	acts_as_votable
	
	belongs_to :list
	has_many :users
	has_many :reviews
	
	validates :name, presence: true
	validates :url, presence: true
end