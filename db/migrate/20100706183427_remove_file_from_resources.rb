class RemoveFileFromResources < ActiveRecord::Migration
  def self.up
    remove_column :resources, :file_file_name
    remove_column :resources, :file_content_type
    remove_column :resources, :file_file_size
  end

  def self.down
    add_column :resources, :file_file_size, :string
    add_column :resources, :file_content_type, :string
    add_column :resources, :file_file_name, :string
  end
end
