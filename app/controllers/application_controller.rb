class ApplicationController < ActionController::Base
  def current_user
    user_id = session[:user_id]
    if user_id
      User.find_by_tg_user_id user_id
    else
      false
    end
  end

  def authorized?
    unless current_user
      redirect_to root_path
    end
  end

  helper_method :current_user 
end
