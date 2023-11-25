class HomeController < ApplicationController
  before_action :authorized?

  def authorized?
    Tg::AuthController.authorized?
    puts "Not authorized"
  end

  def index
    @message = Message.prepare_new
    # @product = @message.products.new
    # @category = @product.build_category
    # @logged_user = cookies[:tg_user]
  end
end
