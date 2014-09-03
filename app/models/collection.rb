class Collection < ActiveRecord::Base
 
  validates :title,:user_id,:presence => true
  validates :title,:format => { :with => /\A[a-zA-Z0-9\s\W]+\z/, :message => "collection Name contains invalid chars"},:length => { :in => 1..100 }
  belongs_to :user
  
  has_many :monuments, :class_name => 'Monument', :foreign_key => :collection_id,:dependent => :destroy
  
end
