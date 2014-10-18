class ProfessionsController < ApplicationController
	def index
		@out = Profession.all
	end

	def create
		@profession = Profession.where({name: params[:name]}.first_or_create)
		@user = User.find(params[:id])
	end

	def new
		@profession = @user.professions.new
	end

	def update
		@profession = @user.professions.find(params[:id])

	end

	def edit
		@profession = @user.professions.find(params[:id])
	end

end## Ben working on this. feel free to edit/add/update