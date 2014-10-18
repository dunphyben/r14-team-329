class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.string :name
    	t.text :overview
    	t.integer :user_id

    	t.timestamps
    end
  end
end
