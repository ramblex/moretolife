class AddPermalinkToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :permalink, :string
  end

  def self.down
  end
end
