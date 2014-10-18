class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
    	t.string :name
    	t.string :url
    	t.integer :list_id
    end
  end
end
