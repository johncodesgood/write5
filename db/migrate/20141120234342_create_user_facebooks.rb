class CreateUserFacebooks < ActiveRecord::Migration
  def change
    create_table :user_facebooks do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
