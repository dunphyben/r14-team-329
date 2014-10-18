class AddProfessionsTable < ActiveRecord::Migration
  def change
    create_table :professions do |t|
    	t.string :name
    	t.integer :user_id

    	t.timestamps
    end
  end
end
