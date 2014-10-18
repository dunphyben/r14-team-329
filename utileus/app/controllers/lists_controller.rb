class ListsController < ApplicationController
	def index
		@out = List.all
	end
end