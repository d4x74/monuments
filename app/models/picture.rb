class Picture < ActiveRecord::Base
  
  belongs_to :monument, :class_name => 'Monument', :foreign_key => :monument_id
  validates :monument, :photo, :presence=>true
  
  #validates :name,:format => { :with => /\A[a-zA-Z0-9\s\W]+\z/, :message => "this picture name contains invalid chars"},:length => { :in => 1..30 }
  #validates :description,:format => { :with => /\A[a-zA-Z0-9\s\W]+\z/, :message => "this description contains invalid chars"},:length => { :in => 1..255 }
  
  has_attached_file :photo, :url => "/:class/:attachment/:id/:basename.:extension"
  validates_attachment_content_type :photo, :content_type =>['image/jpg','image/jpeg', 'image/png', 'image/gif']

end
