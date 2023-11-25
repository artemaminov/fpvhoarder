class RemoveMessageIdFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :message_id, :integer
  end
end
