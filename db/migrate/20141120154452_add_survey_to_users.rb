class AddSurveyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surveyed, :boolean
    add_column :users, :word_count, :string
    add_column :users, :political, :string
    add_column :users, :recycle, :string
  end
end
