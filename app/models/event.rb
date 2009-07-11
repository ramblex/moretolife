class Event < ActiveRecord::Base
  validates_presence_of :name, :short_desc, :area_id
  belongs_to :area
  has_many :event_links
  after_update :save_event_links
  has_attached_file :photo, :styles => { :small => "90x90>" },
  :url => "/images/events/:id/:style/:basename.:extension",
  :path => ":rails_root/public/images/events/:id/:style/:basename.:extension"

  def self.per_page
    6
  end

  def link_attr=(link_attr)
    link_attr.each do |attributes|
      if attributes[:id].blank?
        event_links.build(attributes)
      else
        event_link = event_links.detect { |t| t.id == attributes[:id].to_i }
        event_link.attributes = attributes
      end
    end
  end

  def save_event_links
    event_links.each do |t|
      if t.should_destroy?
        t.destroy
      else
        # False bypasses the validation
        t.save(false)
      end
    end
  end
end
