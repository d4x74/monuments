class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string  :name 
      t.timestamps
    end

    self.load 
  end
    
  def self.down
    drop_table :categories
  end
  
  def self.load
    Category.create(:name=>"Towers")
    Category.create(:name=>"Cathedrals")
    Category.create(:name=>"Squares")
    Category.create(:name=>"Castles")
  end
end
