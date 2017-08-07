class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.references :entry, foreign_key: true
      t.timestamps null: false
    end
  end
end
