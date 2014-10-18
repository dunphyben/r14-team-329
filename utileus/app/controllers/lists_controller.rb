class ListsController < ApplicationController
	def index
		@out = List.all
	end

	def show
		@out = List.find(params[:id])
	end

	def create
		@list = current_user.lists.build(list_params)
		if @list.save
			redirect_to lists_path, notice: "List created successfully!"
		else
			flash[:alert] = "There was a problem creating your list. Please try again."
			render action: :new
		end
	end

	def edit
		@list = List.find(params[:id])
		@apps = App.all
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(list_params)
			redirect_to lists_path, notice: "List successfully updated!"
		else
			@apps = App.all
			render action: :edit
		end
	end

	def destroy
		if List.destroy(params[:id])
			redirect_to lists_path, notice: "List deleted."
		else
			flash[:alert] = "There was a problem deleting your list. Please try again."
			render action: :index
		end
	end

private

	def list_params
		params.require(:list).permit(:name, :overview)
	end
end