class AddIntroduceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduce, :text
    add_column :users, :education, :string
    add_column :users, :atschool, :text
    add_column :users, :skills, :text
    add_column :users, :gender, :integer, default: 0
    add_column :users, :address, :text
  end
end
