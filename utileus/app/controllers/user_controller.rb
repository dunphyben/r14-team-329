class UserController < ApplicationController

  def create
    token    = auth_hash[:credentials][:token]
    name     = auth_hash[:info][:name]
    provider = auth_hash[:provider]

    session[:user_id] = @user.id
    redirect_to confirm_path
end
