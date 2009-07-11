class AddAreaIdToEventsTable < ActiveRecord::Migration
  def self.up
    add_column :events, :area_id, :integer
  end

  def self.down
  end
end
