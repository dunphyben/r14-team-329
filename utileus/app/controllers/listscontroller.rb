ListsController < ApplicationController::Base

def index
	@out = @user.lists 
end