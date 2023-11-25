class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true
      t.string :message_tg_id, null: false

      t.timestamps
    end
  end
end
