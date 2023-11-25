class RemoveChatIdFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_reference :messages, :chat, null: false, foreign_key: true
  end
end
