class AddTgDataToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tg_user_id, :string
  end
end
