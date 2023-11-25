class RemoveMessageIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :message_id, :integer
    remove_column :products, :category_id, :integer
  end
end
