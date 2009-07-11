class AddPermalinkToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :permalink, :string
  end

  def self.down
  end
end
