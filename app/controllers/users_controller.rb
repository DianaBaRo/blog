# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts

    if current_user.id == params[:id].to_i # authorization
      @user
    else
      flash[:error] = 'Sorry, you are authorized to access only your profile page'
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
