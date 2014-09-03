class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
       t.string :email, :null => false, :default => ""
       t.string :encrypted_password, :null => true
       t.timestamps
    end

    add_index :users, :email,                :unique => true
  end

  def self.down
    drop_table :users
  end
  
end
