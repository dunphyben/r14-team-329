class UsersController < ApplicationController  
  def show
    @out = User.find(params[:id])
  end
end
