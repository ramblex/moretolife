class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :date_begin
      t.datetime :date_end
      t.string :venue
      t.text :short_desc
      t.text :long_desc
      t.string :speaker
      t.boolean :featured

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
