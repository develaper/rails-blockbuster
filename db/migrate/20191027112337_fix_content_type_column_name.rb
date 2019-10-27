class FixContentTypeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :contents, :type, :category
  end
end
