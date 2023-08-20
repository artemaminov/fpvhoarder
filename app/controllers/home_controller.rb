class HomeController < ApplicationController

    def index
        @logged_user = cookies[:tg_user]
    end
end
