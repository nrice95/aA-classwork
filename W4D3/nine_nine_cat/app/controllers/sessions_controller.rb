class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username],params[:user][:password])

    if user
      log_in!(user)
      session[:session_token] = user.reset_session_token!
      # debugger
      redirect_to cats_url
    else
      flash[:error] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
end
