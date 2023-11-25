class RemoveChatIdFromChats < ActiveRecord::Migration[7.0]
  def change
    remove_column :chats, :chat_id, :integer
  end
end
