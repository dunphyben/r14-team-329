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
end