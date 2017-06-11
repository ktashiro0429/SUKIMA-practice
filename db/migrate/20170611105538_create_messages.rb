class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.timestamps null: false
    end
  end
end
