class UsersController < ApplicationController
  before_action :authorized?

  def show
    respond_to do |format|
      format.html { render :show, locals: { user: current_user } }
      format.json { render json: current_user }
    end
  end

  def edit

  end
end
