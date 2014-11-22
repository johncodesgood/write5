require 'pry'

class Check < ActiveRecord::Base

  def self.weekly
    puts "Daily check"
    t = Time.new
    if t.sunday?
      puts "It's Sunday!!!"
      week_begin = Date.today.at_beginning_of_week
      week_end = Date.today.at_end_of_week
      users = User.all
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
        end
      end
    end

  end

end
