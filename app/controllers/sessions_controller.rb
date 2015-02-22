class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/posts"
    else
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/posts"
  end

end
