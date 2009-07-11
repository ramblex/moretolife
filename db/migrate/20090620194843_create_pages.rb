class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :mid_col
      t.text :right_col

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
