class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @review = Review.where({})
    @out = Profession.all
  end

  def create
    @user = User.find(params[:id])
    @review = @user.reviews.new
  end

  def new
    @profession = @user.professions.new
  end

  def update
    @profession = @user.professions.find(params[:id])

  end

  def edit
    @profession = @user.professions.find(params[:id])
  end

end## Ben working on this. feel free to edit/add/update