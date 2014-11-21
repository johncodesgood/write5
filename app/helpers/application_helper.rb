module ApplicationHelper

  def logged_in?
    !current_user.nil?
  end




# method to make date look like a date- not being used 
def pretty_date(time)
   time.strftime("%d %b %Y")
end
end