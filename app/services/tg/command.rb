module Tg
  class Command
    def send_to_tg
      debugger
      @message = Message.create(permitted_params)
    end

    def permitted_params
      params.require(:message).permit(
        :text,
        :city,
        uploads: [],
        products_attributes: [
          :id,
          :title,
          :price,
          category_attributes: [:name]
        ],
        user_attributes: %i[tg_user_name tg_user_id]
      )
    end
  end
end
