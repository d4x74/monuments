class Category < ActiveRecord::Base

  validates :name,:presence => true,:format => { :with => /\A[a-zA-Z0-9\s\W]+\z/, :message => "this category contains invalid chars"},:length => { :in => 1..30 }
  has_many :monuments
 end
