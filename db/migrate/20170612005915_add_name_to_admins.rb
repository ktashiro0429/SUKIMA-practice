class AddNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :about, :text
    add_column :admins, :web, :text
    add_column :admins, :address, :text
    add_column :admins, :industry, :string
    add_column :admins, :sns, :text
    add_column :admins, :image, :text
  end
end
