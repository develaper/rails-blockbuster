class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.string :plot, null: false
      t.integer :type, null: false

      t.timestamps
    end
  end
end
