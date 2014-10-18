class ReviewsController < ApplicationController
  def index
    @out = Review.all
  end

  def show
    @out = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review), notice: "Review created successfully!"
    else
      flash[:alert] = "There was a problem creating your review. Please try again."
      render action: :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to reviews_path, notice: "Review successfully updated!"
    else
      @apps = App.all
      render action: :edit
    end
  end

  def destroy
    if Review.destroy(params[:id])
      redirect_to action: 'index'
    else
      flash[:alert] = "There was a problem deleting your review. Please try again."
      redirect_to action: 'index'
    end
  end

private

  def review_params
    params.require(:review).permit(:quick_review, :full_review)
  end
end