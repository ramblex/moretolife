class Resource < ActiveRecord::Base
  acts_as_list
  validates_presence_of :name, :description

  named_scope :without_current, lambda{ |resource| resource ? {:conditions => ["id != ?", resource.id]} : {} }

  has_many :resource_files, :dependent => :destroy
  accepts_nested_attributes_for :resource_files
  # This is not ideal but the links for resources are the same sort of thing as
  # event links.
  has_many :event_links, :dependent => :destroy
  accepts_nested_attributes_for :event_links
end
