class CreateResourceFiles < ActiveRecord::Migration
  def self.up
    create_table :resource_files do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :resource_files
  end
end
