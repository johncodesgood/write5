class AddFacebookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, :default => ""
    add_column :users, :uid, :string, :default => ""
  end
end
