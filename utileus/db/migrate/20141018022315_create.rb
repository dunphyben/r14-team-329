class Create < ActiveRecord::Migration
  def change
  	create_table :reviews do |t|
  	t.string :quick_review
  	t.text :full_review
  	t.integer :app_id

  	t.timestamps		
  	end
  end
end
