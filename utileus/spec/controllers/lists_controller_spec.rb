require 'rails_helper'

describe ListsController do 
	describe "index" do 
		before(:each) do 
			@user = FactoryGirl.create(:user, id: 1)
			@list = FactoryGirl.create(:list, id: 1, user_id: 1)
			get :index
		end

		it "returns http code 200" do
			expect(response).to have_http_status(200)
		end

		it "returns a list of a user's lists" do 
			expect(List.all).not_to eq nil
		end
	end

	describe "show" do
		before(:each) do 
			@list = FactoryGirl.create(:list)
			get(:show, { 'id' => @list.id })
		end

		it "returns http code 200" do
			expect(response).to have_http_status(200)
		end

		it "returns a list" do
			expect(List.find(@list.id)).not_to eq nil
		end
	end

	describe "create" do
		before(:each) do
			@list = FactoryGirl.build(:list)
			get(:create, { 'list' => @list })
		end

		it "returns http code 200" do
			expect(response).to have_http_status(200)
		end

		it "creates a list in the DB" do
			expect(List.all).to contain @list
		end
	end

	describe "edit" do
		before(:each) do
			@list = FactoryGirl.create(:list)
			get(:edit, { 'id' => @list.id })
		end

		it "returns http code 200" do
			expect(response).to have_http_status(200)
		end
	end

	describe "update" do
		before(:each) do
			@list = FactoryGirl.create(:list)
		end

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

	describe "destroy" do
		before(:each) do
			@list = FactoryGirl.create(:list)
		end

		it "returns http code 200" do 
			expect(response).to have_http_status(200)
		end

		it "deletes a list" do
			expect{ delete :destroy, id: @list.id }.to change(List, :count).by(-1)
		end
	end
end