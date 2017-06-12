class AddBodyToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :body, :text 
  end
end
