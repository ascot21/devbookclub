class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    flash[:notice] = "You can only update your own profile"
    redirect_to root_path
  end
end
