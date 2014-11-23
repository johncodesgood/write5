require 'pry'
class User < ActiveRecord::Base
  has_many :articles
  has_one :facebook_oauth_setting
  has_one :accountability_keeper

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

  # def self.text_friend
  #   binding.pry
  #   ENV["account_sid"]
  #   ENV["auth_token"]

  #   @client = Twilio::REST::Client.new account_sid, auth_token

  #   @client.account.messages.create({
  #     :from => '+15519996336',
  #     :to => "+1#{(self.accountability_keeper).to_i}",
  #     :body => "Remember when #{self.name} was supposed to finish writing some stuff this week? You should look into that...",
  #   })

  # end


  # THIS MAY NOT WORK, BUT IT MIGHT...

  validates :word_count, presence: true, on: "update"
  validates :political, presence: true, on: "update"
  validates :recycle, presence: true, on: "update"
  validates :accountability_keeper, presence: true, :numericality => {:only_integer => true}, on: "update"

end

