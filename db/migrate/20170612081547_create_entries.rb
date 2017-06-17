class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, null:false
      t.string :title, null:false
      t.datetime :posted_at, null:false
      t.string :industry
      t.string :job_category
      t.string :area
      t.string :status, null: false, default:"draft"
      t.timestamps null: false
    end
    add_index :entries, :user_id
  end
end
