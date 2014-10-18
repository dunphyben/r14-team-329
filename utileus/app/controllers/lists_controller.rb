class ListsController < ApplicationController
	def index
		@out = List.all
	end

	def show
		@out = List.find(params[:id])
	end
end