class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back!"
      redirect_to user
    else
      flash.now[:alert] = "Hmm, it looks like something's not quite right. Let's try that again!"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See ya later!"
    redirect_to root_path
  end
end
