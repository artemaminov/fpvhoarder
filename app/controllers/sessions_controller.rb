class SessionsController < ApplicationController
  def create
    if Tg::Auth.check(params[:user])
      user = User.authorize(user_params)
      session[:user_id] = user.tg_user_id
      redirect_to user_path
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  
    def user_params
      permitted = params.require(:user).permit(:username, :id)
      { tg_user_name: permitted[:username], tg_user_id: permitted[:id] }
    end
end
