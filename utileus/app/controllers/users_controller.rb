class UsersController < ApplicationController  
  def show
    @out = User.find(params[:id])
  end

  def search
    List.search(params[:q])
  end
end
