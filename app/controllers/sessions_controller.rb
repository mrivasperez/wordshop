class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back!"
      redirect_to user
    else
      flash.now[:alert] = "Hmm, it looks like something's not quite right. Let's try that again!"
      render "new", status: :unprocessabe_entity
    end
  end

  def destroy
  end
end
