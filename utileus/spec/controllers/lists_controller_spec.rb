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
			@updated_list = FactoryGirl.attributes_for(:list, overview: "This is an updated list.")
			get(:update, { 'id' => @list.id, 'list' => @updated_list })
		end

		it "returns http code 302" do 
			expect(response).to have_http_status(302)
		end

		it "updates a list" do
			expect(List.find(@list.id).overview).to eq "This is an updated list."
		end
	end
end