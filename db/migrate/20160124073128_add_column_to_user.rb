class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :user_name, :string
  	add_column :users, :first_name, :string
  	add_column :users, :middle_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :mobile_no, :integer,:limit => 8
  	add_column :users, :address, :text
  	add_column :users, :user_type, :string
  end
end

