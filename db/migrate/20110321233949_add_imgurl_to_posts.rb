class AddImgurlToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :imgurl, :string
  end

  def self.down
    remove_column :posts, :imgurl
  end
end
