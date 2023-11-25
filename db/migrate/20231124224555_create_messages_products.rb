class CreateMessagesProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :messages_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
