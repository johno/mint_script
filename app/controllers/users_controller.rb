class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followed_users

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
end