class AccountabilityKeeper < ActiveRecord::Base
  belongs_to :user

  # def initialize(options={})
    # @user = current_user
  # end

  def text_friend(user)
    # ENV["account_sid"]
    # ENV["auth_token"]
    @user = user
    account_sid = 'ACcaae044553dde80112b45a44a14d0ac5'
    auth_token = '425eee6044e863987cc2c7f73ddee8f5'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+15519996336',
      :to => "+1#{(@user.accountability_keeper).to_i}",
      :body => "Remember when #{@user.name} was supposed to finish writing some stuff this week? You should look into that...",
    })

  end
end