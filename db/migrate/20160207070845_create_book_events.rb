class CreateBookEvents < ActiveRecord::Migration
  def change
    create_table :book_events do |t|
      
      t.integer :user_id
      t.string  :booking_id
      t.integer :function_id
      t.integer :venue_id
      t.integer :no_of_guest
      t.date :date
      t.integer :total_amount
      t.string  :status

      t.timestamps null: false
    end
  end
end
