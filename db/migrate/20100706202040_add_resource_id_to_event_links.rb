class AddResourceIdToEventLinks < ActiveRecord::Migration
  def self.up
    add_column :event_links, :resource_id, :integer
  end

  def self.down
  end
end
