class AppsController < ApplicationController
	def index
		@out = App.all
	end

	def show
		@out = App.find(params[:id])
	end

	def create
	 @app = App.find_or_initialize_by(app_params)
		if @app.save
			redirect_to app_path(@app), notice: "App created successfully!"
		else
			flash[:alert] = "There was a problem creating your app. Please try again."
			render action: :new
		end
	end

	def edit
		@app = App.find(params[:id])
	end

	def update
		@app = App.find(params[:id])
		if @app.update_attributes(app_params)
			redirect_to apps_path, notice: "App successfully updated!"
		else
			@apps = App.all
			render action: :edit
		end
	end

	def destroy
		if App.destroy(params[:id])
			redirect_to action: 'index'
		else
			flash[:alert] = "There was a problem deleting your app. Please try again."
			redirect_to action: 'index'
		end
	end

private

	def app_params
		params.require(:app).permit(:name, :url)
	end
end