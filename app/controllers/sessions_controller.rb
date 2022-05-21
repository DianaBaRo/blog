# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      flash[:error] = 'Login info was incorrect. Please try again.'
      render :new
    end
  end

  def destroy
    if current_user
      session.delete :user_id

      redirect_to root_url
    end
  end
end
