class AddColorToWidget < ActiveRecord::Migration
  def self.up
    add_column "widgets", :color, :string
  end

  def self.down
    remove_column "widgets", :color, :string
  end
end
