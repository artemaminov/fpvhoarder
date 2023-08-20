class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :chat_id
      t.string :title

      t.timestamps
    end
  end
end
