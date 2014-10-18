class AddVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :user_id
    	t.integer :app_id
    	t.integer :list_id

    	t.timestamps
    end
  end
end
