class AddRemainingServerColumns < ActiveRecord::Migration
  def change
    remove_column :servers, :ip4
    add_column :servers, :ipv4, :string
    add_column :servers, :ipv6, :string
    add_column :servers, :location, :string
  end
end
