class LoginController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user&.authenticate(params[:login][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to user
    else
      flash.now[:alert] = 'Check login details and retry'
      render 'new'
    end
  end

  def destroy

  end
end
