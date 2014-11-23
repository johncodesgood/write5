require 'pry'
class User < ActiveRecord::Base
  has_many :articles
  has_one :facebook_oauth_setting

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.auth_token = auth['credentials']['token']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end


  # THIS MAY NOT WORK, BUT IT MIGHT...

  validates :word_count, presence: true, on: "update"
  validates :political, presence: true, on: "update"
  validates :recycle, presence: true, on: "update"
  validates :friend_phone_number, presence: true, :numericality => {:only_integer => true}, on: "update"

end

