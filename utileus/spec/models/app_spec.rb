require 'rails_helper'

describe App do 
	it { should have_many :reviews }
	it { should belong_to :list }

	describe "upvote" do 
		it "upvotes an app" do 
			app = FactoryGirl.create(:app)
			user = FactoryGirl.create(:user)
			app.liked_by user

			expect(app.get_likes.size).to_not eq 0
		end
	end
end