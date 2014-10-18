class App < ActiveRecord::Base
	belongs_to :list
	has_many :reviews
end