require 'rails_helper'

describe ListsController do 
	describe "index" do 
		it "populates an array of lists" do 
			list = FactoryGirl.create(:list)
			get :index
			expect(assigns(:out)).to eq([list])
		end

		it "renders the :index template" do 
			get :index 
			expect(response).to render_template :index
		end
	end

	describe "show" do
		it "assigns the requested list to @out" do 
			list = FactoryGirl.create(:list)
			get :show, id: list
			expect(assigns(:out)).to eq(list)
		end

		it "renders the show template" do
			get :show, id: FactoryGirl.create(:list)
			expect(response).to render_template :show			
		end
	end

	describe "create" do
		context "with valid attributes" do
		it "creates a new list" do
			expect{ post :create, list: FactoryGirl.attributes_for(:list) }.to change(List, :count).by(1)
		end

		it "redirects to the new contact" do
			post :create, list: FactoryGirl.attributes_for(:list)
			expect(response).to redirect_to List.last
		end
		context "with invalid attributes" do 
			it "does not save the new list" do 
				expect { post :create, list: FactoryGirl.attributes_for(:list, name: nil) }.to_not change(List, :count)
			end

			it "re-renders the new template" do
				post :create, list: FactoryGirl.attributes_for(:list, name: nil)
				expect(response).to render_template :new
			end
		end
	end
end

	describe "update" do
		before(:each) do
			@list = FactoryGirl.create(:list)
		end

		context "with valid attributes" do
			it "located the requested @list" do 
				put :update, id: @list.id, list: FactoryGirl.attributes_for(:list)
				expect{ assigns(:list).to eq @list }
			end

			it "changes @list's attributes" do
				put :update, id: @list, list: FactoryGirl.attributes_for(:list, overview: "Updated")
				@list.reload
				expect(@list.overview).to eq ("Updated")
			end
		end

		context "with invalid attributes" do
			it "located the requested @list" do 
				put :update, id: @list.id, list: FactoryGirl.attributes_for(:list)
				expect{ assigns(:list).to eq @list }
			end

			it "does not change @list's attributes" do 
				name = @list.name
				put :update, id: @list.id, list: FactoryGirl.attributes_for(:list, name: nil)
				@list.reload
				expect(@list.name).to eq name
			end

			it "re-renders the edit template" do 
				put :update, id: @list.id, list: FactoryGirl.attributes_for(:list, name: nil)
				expect(response).to render_template :edit
			end
		end
	end

	describe "destroy" do
		before(:each) do
			@list = FactoryGirl.create(:list)
		end

		it "deletes the @list" do
			expect{ delete :destroy, id: @list.id }.to change(List, :count).by(-1)
		end

		it "redirects to lists#index" do 
			get :index
			expect(response).to render_template :index
		end
	end
end