class UsersController < ApplicationController

  def followed
    @user = User.find(params[:id])
    @users = @user.followed
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end
end
