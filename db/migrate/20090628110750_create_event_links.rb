class CreateEventLinks < ActiveRecord::Migration
  def self.up
    create_table :event_links do |t|
      t.string :title
      t.string :url
      t.integer :event_id
      t.timestamps
    end
  end

  def self.down
    drop_table :event_links
  end
end
