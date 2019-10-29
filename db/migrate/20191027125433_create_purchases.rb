class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.float :price, null: false, default: 2.99
      t.integer :quality, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :expires_at
      t.references :content, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
