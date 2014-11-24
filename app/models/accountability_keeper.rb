require 'pry'

class AccountabilityKeeper < ActiveRecord::Base
  belongs_to :user

  # def initialize(options={})
    # @user = current_user
  # end

  def text_friend(user)
    # ENV["account_sid"]
    # ENV["auth_token"]
    @user = user
    # account_sid = 'ACcaae044553dde80112b45a44a14d0ac5'
    # auth_token = '425eee6044e863987cc2c7f73ddee8f5'
    account_sid = 'ACfe71131fcea1a86e22c44ff95a779d1a' 
    auth_token = 'c270faac49003d2d76f084028a02a0af'

    @client = Twilio::REST::Client.new account_sid, auth_token 

    phone = @user.accountability_keeper.accountability_keeper

    @client.account.messages.create({
        :from => '+15519996336',
        :to => phone, 
        :body => "Remember when #{@user.name} was supposed to finish writing some stuff this week? You should look into that...",   
    })

      #  :from => '+14846853890', 
    # @client.account.messages.create({
    #   # :from => '+15519996336',
    #   :from => '+14846853890',
    #   # :to => "#{@user.accountability_keeper.accountability_keeper.to_i}",
    #   :to => "+1#{@user.accountability_keeper.accountability_keeper}",
    #   :body => "Remember when #{@user.name} was supposed to finish writing some stuff this week? You should look into that...",
    # })

  end
end