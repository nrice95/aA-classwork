class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      log_in!(user)
      session[:session_token] = user.reset_session_token!

      redirect_to cats_url
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_url
    end
  end



  def user_params
    params.require(:user).permit(:username,:password)
  end

end
