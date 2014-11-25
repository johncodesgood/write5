require 'pry'

class AccountabilityKeeper < ActiveRecord::Base
  belongs_to :user

  # def initialize(options={})
    # @user = current_user
  # end

  def text_friend(user)
    # Per Aldric:
    # Heroku: https://github.com/maninigupta/wdi_nyc_sept_2014_lemur/blob/master/reference/heroku/interacting-with-heroku.md#manage-the-configuration--environment-variables
    # Locally: add variables to .env file
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]
    twilio_phone = ENV["twilio_phone"]
    @user = user

    @client = Twilio::REST::Client.new account_sid, auth_token

    phone = @user.accountability_keeper.accountability_keeper

    @client.account.messages.create({
        :from => twilio_phone,
        :to => phone,
        :body => "Remember when #{@user.name} was supposed to finish writing some stuff this week? You should look into that...",
    })

  end
end