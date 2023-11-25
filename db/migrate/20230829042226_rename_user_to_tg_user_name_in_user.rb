class RenameUserToTgUserNameInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :tg_user_name
  end
end
