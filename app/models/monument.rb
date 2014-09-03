class Monument < ActiveRecord::Base

  belongs_to :collection, :class_name => 'Collection', :foreign_key => :collection_id
  
  has_many :pictures, :class_name => 'Picture', :foreign_key => :monument_id,:dependent => :destroy
  
  
  belongs_to :category,:class_name => 'Category', :foreign_key => :category_id
  
  validates  :collection_id, :category_id, :presence => true
  
  validates :name,:presence => true,:format => { :with => /\A[a-zA-Z0-9\s\W]+\z/, :message => "this monument name contains invalid chars"},:length => { :in => 1..30 }
  validates :description,:presence => true,:format => { :with => /\A[a-zA-Z0-9\s\W]+\z/, :message => "this description contains invalid chars"},:length => { :in => 1..255 }

  include PgSearch
  multisearchable :against => [:name,:description]
  
 
end
