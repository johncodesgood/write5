require 'pry'
class User < ActiveRecord::Base
  has_many :articles

    # binding.pry
    # before_save { self.email = email.downcase }
    # validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # validates :email, presence: true, length: { maximum: 255 },
    #                 format: { with: VALID_EMAIL_REGEX },
    #                 uniqueness: { case_sensitive: false }

    # has_secure_password
    # validates :password, length: { minimum: 6 }

  # def self.create_with_omniauth(auth)
  #   @facebook_user = 1
  #   create! do |user|
  #     user.provider = auth['provider']
  #     user.uid = auth['uid']
  #     user.auth_token = auth['credentials']['token']
  #     if auth['info']
  #       user.name = auth['info']['name'] || ""
  #       user.email = auth['info']['email'] || ""
  #     end
  #   end
  # end

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

