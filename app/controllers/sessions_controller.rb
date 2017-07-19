class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user.nil?
      flash[:notice] = "We don't have a user with that name. Please try again or create an account."
      render :new
    elsif user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Successful login"
      redirect_to root_path
    else
      flash[:notice] = "The database doesn't like you. Try again or make an account."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Goodbye"
    redirect_to root_path
  end

end
