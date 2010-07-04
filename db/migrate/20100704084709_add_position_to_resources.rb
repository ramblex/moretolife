class AddPositionToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :position, :integer
  end

  def self.down
    remove_column :resources, :position
  end
end
