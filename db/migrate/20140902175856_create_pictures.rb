class CreatePictures < ActiveRecord::Migration
  
  def self.up
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :monument_id
      t.string :name
      t.text :description
      t.attachment :photo
      t.datetime :date
      t.timestamps
    end
  end
    
  def self.down
    drop_table :pictures
  end

end
