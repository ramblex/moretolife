class ResourceFile < ActiveRecord::Base
  belongs_to :resource
  has_attached_file :file,
  :url => "/resources/:id/:basename.:extension",
  :path => ":rails_root/public/resources/:id/:basename.:extension"
end
