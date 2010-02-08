class AddResourcesPaperclip2 < ActiveRecord::Migration
  def self.up
    add_column :resources, :file_file_name, :string
    add_column :resources, :file_content_type, :string
    add_column :resources, :file_file_size, :string
  end

  def self.down
  end
end
