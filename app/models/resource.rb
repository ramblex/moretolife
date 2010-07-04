class Resource < ActiveRecord::Base
  acts_as_list
  validates_presence_of :name, :description
  has_attached_file :file, 
  :url => "/resources/:id/:basename.:extension",
  :path => ":rails_root/public/resources/:id/:basename.:extension"
end
