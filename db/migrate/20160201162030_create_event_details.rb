class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
    	t.integer :venu_id
    	t.integer :price_id
    	t.integer :phone_number
    	t.integer :mobile_number
    	t.integer :capacity
    	t.integer :function_id
    	t.string :image
      t.timestamps null: false
    end
  end
end
