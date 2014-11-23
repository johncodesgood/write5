class AccountabilityKeeperTable < ActiveRecord::Migration
  def change
    create_table :accountability_keepers do |t|
      t.string :accountability_keeper
      t.references :user

      t.timestamps
    end
  end
end
