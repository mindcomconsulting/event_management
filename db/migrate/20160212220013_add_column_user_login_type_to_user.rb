class AddColumnUserLoginTypeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :user_login_type, :string
  end
end
