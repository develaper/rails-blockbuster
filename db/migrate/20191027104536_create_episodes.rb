class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.string :title, null: false
      t.string :plot, null: false
      t.integer :number, null: false
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
