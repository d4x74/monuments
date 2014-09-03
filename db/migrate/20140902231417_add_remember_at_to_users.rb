class AddRememberAtToUsers < ActiveRecord::Migration
 
  def self.up
    change_table :users do |t|
      t.datetime :remember_created_at
     end
  end
  
  def self.down
    remove_column :users, :remember_created_at, :datetime
  end
end
  
    