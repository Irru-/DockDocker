class AddNameAndIpToServer < ActiveRecord::Migration
  def change
    add_column :servers, :name, :string
    add_column :servers, :ip4, :string
  end
end
