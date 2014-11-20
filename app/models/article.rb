class Article < ActiveRecord::Base
  belongs_to :users
  validates :title, presence: true,
                    length: { minimum: 1 }
end
