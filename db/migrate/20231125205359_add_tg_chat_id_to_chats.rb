class AddTgChatIdToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :tg_chat_id, :integer
  end
end
