class RemoveTgIdFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :tg_id, :integer
  end
end
