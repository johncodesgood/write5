require 'pry'

class UsersController < ApplicationController

  def index

  end 

  def login
     # @user_koala = User.koala(request.env['omniauth.auth']['credentials'])

    auth = request.env["omniauth.auth"]
    @user = User.where(:provider => auth['provider'], 
                    :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def survey
    @word_count = params[:user][:word_count]
    @political = params[:user][:political]
    @recycle = params[:user][:recycle]

    current_user.update_columns(word_count: @word_count, political: @political, recycle: @recycle, surveyed: true)
    redirect_to user_path(current_user)
  end

  def show
    # @user_graph = Koala::Facebook::API.new(current_user.auth_token)
    # @user_graph.put_connections("me", "feed", :message => "I am writing on my wall!")
    @user = User.find(params[:id])
    # page_token = @user_graph.get_connections('me', 'accounts')
    # page_id = page_token[1]["id"]
    # page_token = @user_graph.get_page_access_token(page_id)
    # @page_graph = Koala::Facebook::API.new(page_token) 
  end

  def logout
    reset_session
    redirect_to root_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_url
  end


  # def new
  #   @user = User.new
  # end

  # def create
  # user = User.new(user_params)
  #   if user.save
  #     log_in user
  #     redirect_to user
  #   else
  #     render 'new'
  #   end
  # end

  # def index
  #   @users = User.all
  # end


  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])

  #   if @user.update(user_params)
  #     redirect_to @user
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   redirect_to users_path
  # end

  # private

  #   def user_params
  #     params.require(:user).permit(:name, :email, :password)
  #   end

end
