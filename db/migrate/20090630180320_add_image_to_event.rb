class AddImageToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :image, :string
  end

  def self.down
  end
end
