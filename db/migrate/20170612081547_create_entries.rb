class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, null:false
      t.string :title, null:false
      t.datetime :posted_at, null:false
      t.string :industry, null: false, unique: true
      t.string :job_category, null: false, unique: true
      t.string :area, null: false, unique: true
      t.string :status, null: false, default:"draft"
      t.timestamps null: false
    end
    add_index :entries, :user_id
  end
end
