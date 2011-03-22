class AddWebToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :web, :string
    add_column :posts, :nus, :string
  end

  def self.down
    remove_column :posts, :nus
    remove_column :posts, :web
  end
end
