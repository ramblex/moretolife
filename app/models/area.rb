class Area < ActiveRecord::Base
  validates_presence_of :name, :description, :permalink
  has_many :events
end
