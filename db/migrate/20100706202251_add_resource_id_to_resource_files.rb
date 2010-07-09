class AddResourceIdToResourceFiles < ActiveRecord::Migration
  def self.up
    add_column :resource_files, :resource_id, :integer
  end

  def self.down
    remove_column :resource_files, :resource_id
  end
end
