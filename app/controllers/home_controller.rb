class HomeController < ApplicationController
  def index
    if current_user
      redirect_to user_path, status: 302
    else
      render "shared/login"
    end
  end
end
