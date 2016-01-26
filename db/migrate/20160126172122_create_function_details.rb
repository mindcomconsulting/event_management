class CreateFunctionDetails < ActiveRecord::Migration
  def change
    create_table :function_details do |t|
    	t.string :name
    	t.text :description
      t.timestamps null: false
    end
  end
end
