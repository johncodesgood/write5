class AddFriendPhoneNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :friend_phone_number, :integer
  end
end
