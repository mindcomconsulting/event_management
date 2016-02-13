class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.text :feedback
      t.date :date
      t.string :email

      t.timestamps null: false
    end
  end
end
