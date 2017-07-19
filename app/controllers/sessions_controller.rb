class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Successful login"
      redirect_to user
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Goodbye"
    redirect_to root_path
  end

end
