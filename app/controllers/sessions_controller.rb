require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      redirect_to user
    else
      render 'new'
    end
  end

end
