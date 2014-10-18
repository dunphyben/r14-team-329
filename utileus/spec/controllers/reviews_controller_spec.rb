require 'rails_helper'

describe ReviewsController do 
	describe "index" do 
		it "populates an array of reviews" do 
			review = FactoryGirl.create(:review)
			get :index
			expect(assigns(:out)).to eq([review])
		end

		it "renders the :index template" do 
			get :index 
			expect(response).to render_template :index
		end
	end

	describe "show" do
		it "assigns the requested review to @out" do 
			review = FactoryGirl.create(:review)
			get :show, id: review
			expect(assigns(:out)).to eq(review)
		end

		it "renders the show template" do
			get :show, id: FactoryGirl.create(:review)
			expect(response).to render_template :show			
		end
	end

	describe "create" do
		context "with valid attributes" do
		it "creates a new review" do
			expect{ post :create, review: FactoryGirl.attributes_for(:review) }.to change(Review, :count).by(1)
		end

		it "redirects to the new contact" do
			post :create, review: FactoryGirl.attributes_for(:review)
			expect(response).to redirect_to Review.last
		end
		
		context "with invalid attributes" do 
			it "does not save the new review" do 
				expect { post :create, review: FactoryGirl.attributes_for(:review, quick_review: nil) }.to_not change(Review, :count)
			end

			it "re-renders the new template" do
				post :create, review: FactoryGirl.attributes_for(:review, quick_review: nil)
				expect(response).to render_template :new
			end
		end
	end
end

	describe "update" do
		before(:each) do
			@review = FactoryGirl.create(:review)
		end

		context "with valid attributes" do
			it "located the requested @review" do 
				put :update, id: @review.id, review: FactoryGirl.attributes_for(:review)
				expect{ assigns(:review).to eq @review }
			end

			it "changes @review's attributes" do
				put :update, id: @review, review: FactoryGirl.attributes_for(:review, quick_review: "Updated")
				@review.reload
				expect(@review.quick_review).to eq ("Updated")
			end
		end

		context "with invalid attributes" do
			it "located the requested @review" do 
				put :update, id: @review.id, review: FactoryGirl.attributes_for(:review)
				expect{ assigns(:review).to eq @review }
			end

			it "does not change @review's attributes" do 
				quick_review = @review.quick_review
				put :update, id: @review.id, review: FactoryGirl.attributes_for(:review, quick_review: nil)
				@review.reload
				expect(@review.quick_review).to eq quick_review
			end

			it "re-renders the edit template" do 
				put :update, id: @review.id, review: FactoryGirl.attributes_for(:review, quick_review: nil)
				expect(response).to render_template :edit
			end
		end
	end

	describe "destroy" do
		before(:each) do
			@review = FactoryGirl.create(:review)
		end

		it "deletes the @review" do
			expect{ delete :destroy, id: @review.id }.to change(Review, :count).by(-1)
		end

		it "redirects to reviews#index" do 
			get :index
			expect(response).to render_template :index
		end
	end
end