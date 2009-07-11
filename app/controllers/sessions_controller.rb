class SessionsController < ApplicationController
  def new
  end

  def create
    session[:password] = params[:password]
    if admin?
      flash[:notice] = 'Successfully logged in'
      redirect_to home_path
    else
      flash[:error] = 'Incorrect password'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    unless admin?
      flash[:notice] = 'Successfully logged out'
    end
    redirect_to login_path
  end
end
