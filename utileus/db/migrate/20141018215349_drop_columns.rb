class DropColumns < ActiveRecord::Migration
  def change
  	remove_column :professions, :user_id
  	remove_column :users, :profession_id
  end
end
