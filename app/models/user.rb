class User < ActiveRecord::Base

  cattr_accessor :current_user
  
  devise  :database_authenticatable,:rememberable,:registerable
  
  has_many :monuments, :class_name => 'Monument', :foreign_key => :user_id
  has_many :collections, :class_name => 'Colletion', :foreign_key => :user_id
  has_many :pictures, :class_name => 'Picture', :foreign_key => :user_id
  
 # validates :email ,:presence => true, :length => { :in => 8..100 },:format => { :with => /([\s]+)((?:[-a-z0-9]\.)[a-z]{2,})/i, :message => "This is not a valid address" }
  validates :email ,:password,:presence => true, :length => { :in => 8..100 }
        
  validates_format_of :password,
                :with => /.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\d\W]).*/, 
                :message => "must be at least 8 characters, have one number, one capital letter and a special char",
                :if => Proc.new { |user| !user.password.blank? }
end