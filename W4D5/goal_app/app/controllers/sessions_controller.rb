class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    #for later
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      log_in!(user)
    else
      flash.now[:errors] = ["Invalid username or passwerd"]
      render :new
    end
  end

  def destroy
    #for laterer
    log_out!
  end
end
