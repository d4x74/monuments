class CreateMonuments < ActiveRecord::Migration
 
  def self.up
    create_table :monuments do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :collection_id
      t.integer :category_id
      t.timestamps
    end
  end
    
  def self.down
    drop_table :monuments
  end


end
