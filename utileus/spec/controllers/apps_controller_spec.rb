require 'rails_helper'

describe AppsController do 
	describe "index" do 
		it "populates an array of apps" do 
			app = FactoryGirl.create(:app)
			get :index
			expect(assigns(:out)).to eq([app])
		end

		it "renders the :index template" do 
			get :index 
			expect(response).to render_template :index
		end
	end

	describe "show" do
		it "assigns the requested app to @out" do 
			app = FactoryGirl.create(:app)
			get :show, id: app
			expect(assigns(:out)).to eq(app)
		end

		it "renders the show template" do
			get :show, id: FactoryGirl.create(:app)
			expect(response).to render_template :show			
		end
	end

	describe "create" do
		context "with valid attributes" do
		it "creates a new app" do
			expect{ post :create, app: FactoryGirl.attributes_for(:app) }.to change(App, :count).by(1)
		end

		it "redirects to the new contact" do
			post :create, app: FactoryGirl.attributes_for(:app)
			expect(response).to redirect_to App.last
		end
	end
		
		context "with invalid attributes" do 
			it "does not save the new app" do 
				expect { post :create, app: FactoryGirl.attributes_for(:app, name: nil) }.to_not change(App, :count)
			end

			it "re-renders the new template" do
				post :create, app: FactoryGirl.attributes_for(:app, name: nil)
				expect(response).to render_template :new
			end
		end

		context "with the same name" do
			it "does not save the new app" do
				app = FactoryGirl.create(:app)
				expect { post :create, app: FactoryGirl.attributes_for(:app, name: app.name, url: app.url) }.to_not change(App, :count)
			end
		end
	end

	describe "update" do
		before(:each) do
			@app = FactoryGirl.create(:app)
		end

		context "with valid attributes" do
			it "located the requested @app" do 
				put :update, id: @app.id, app: FactoryGirl.attributes_for(:app)
				expect{ assigns(:app).to eq @app }
			end

			it "changes @app's attributes" do
				put :update, id: @app, app: FactoryGirl.attributes_for(:app, name: "Updated")
				@app.reload
				expect(@app.name).to eq ("Updated")
			end
		end

		context "with invalid attributes" do
			it "located the requested @app" do 
				put :update, id: @app.id, app: FactoryGirl.attributes_for(:app)
				expect{ assigns(:app).to eq @app }
			end

			it "does not change @app's attributes" do 
				name = @app.name
				put :update, id: @app.id, app: FactoryGirl.attributes_for(:app, name: nil)
				@app.reload
				expect(@app.name).to eq name
			end

			it "re-renders the edit template" do 
				put :update, id: @app.id, app: FactoryGirl.attributes_for(:app, name: nil)
				expect(response).to render_template :edit
			end
		end
	end

	describe "destroy" do
		before(:each) do
			@app = FactoryGirl.create(:app)
		end

		it "deletes the @app" do
			expect{ delete :destroy, id: @app.id }.to change(App, :count).by(-1)
		end

		it "redirects to apps#index" do 
			get :index
			expect(response).to render_template :index
		end
	end
end