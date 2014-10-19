require 'rails_helper'

describe List do 
	it { should have_many :apps }
	it { should belong_to :user }

	describe "upvote" do 
		it "upvotes a list" do 
			list = FactoryGirl.create(:list)
			user = FactoryGirl.create(:user)
			list.liked_by user
			expect(list.get_likes.size).to_not eq 0
		end
	end
end