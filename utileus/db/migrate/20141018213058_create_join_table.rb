class CreateJoinTable < ActiveRecord::Migration
  def change
  	create_table :professions_users do |t|
    	t.integer :profession_id
    	t.integer :user_id
    	
    	t.timestamps
    end
  end
end
