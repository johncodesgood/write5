require 'pry'


class Check < ActiveRecord::Base

  def self.weekly
    puts "Daily check"
    t = Time.new

    # if t.sunday?
      puts "It's Sunday!!!"
      week_begin = Date.today.at_beginning_of_week
      week_end = Date.today.at_end_of_week
      users = User.all
      acct_keepers = AccountabilityKeeper.all
      users.each do |user|
        count = 0
        user.articles.each do |article|
          if (article.created_at >= week_begin) && (article.text.split.size >= user.word_count.to_i)
            count += 1
          end
        end
        if count >= 5
          puts "#{user.name} no shaming"
        else
          puts "#{user.name} shaming"
          curr_acct_keeper = AccountabilityKeeper.find_by(user_id: user.id)
          curr_acct_keeper.text_friend(user)
          @user_graph = Koala::Facebook::API.new(user.auth_token)
          if user.political == "liberal"
            num = rand(1000)
            @user_graph.put_connections("me", "feed", :message => "I just donated to Sarah Palin's PAC!  'America is looking for answers. She's looking for a new direction; the world is looking for a light. That light can come from America's great North Star; it can come from Alaska.' #{num}")
          else
            @user_graph.put_connections("me", "feed", :message => "I just donated to the Obamacare Outreach Program!  'Universal healthcare is a right, not a priveledge.'")
          end
        end
      end
    # end
  end
end

