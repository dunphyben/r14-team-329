class VotesController < ApplicationController


	def create
		@vote = Vote.new({name: params[:name]})
		current_user.votes << @vote
		render json: {success: true, name: @vote.name, id: @vote.id }
	end

## Ben wrote this before adding act_as_votable gem, so probably bad

end