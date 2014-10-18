class UsersController < ApplicationController  
  def create
    token    = auth_hash[:credentials][:token]
    name     = auth_hash[:info][:name]
    provider = auth_hash[:provider]
    # image = auth_hash[:info][:image]
    # @user = User.where(name: name, token: token, type: "#{provider}".capitalize).first_or_create

    session[:user_id] = @user.id
    redirect_to confirm_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @current_user = @user
    end

    def auth_hash
      request.env['omniauth.auth']      
    end
end
