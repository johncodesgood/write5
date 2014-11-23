class AccountabilityKeeper < ActiveRecord::Base
  def initialize(user)
    @user = user
  end

  def text_friend(message)
    ENV["account_sid"]
    ENV["auth_token"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+15519996336',
      :to => "+1#{@user.friend_phone_number}",
      :body => "Remember when #{@user.name} was supposed to finish writing some stuff this week? You should look into that...",
    })

  end
end