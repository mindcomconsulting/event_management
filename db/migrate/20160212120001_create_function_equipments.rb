class CreateFunctionEquipments < ActiveRecord::Migration
  def change
    create_table :function_equipments do |t|
    	
    	t.integer :user_id
    	t.integer :book_event_id
    	t.boolean :dj
    	t.boolean :stage
    	t.boolean :mike_speaker
    	t.boolean :break_fast
    	t.boolean :lunch
    	t.boolean :tea_snack
    	t.boolean :dinner
    	t.string :food_type
    	t.string :lunch_type
    	t.string :dinner_type
    	t.string :light_type
    	t.string :flower_type
    	t.string :sitting_chair_type

      t.timestamps null: false
    end
  end
end


