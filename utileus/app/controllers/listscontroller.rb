class ListsController < ApplicationController

def index
	@out = @user.lists 
end