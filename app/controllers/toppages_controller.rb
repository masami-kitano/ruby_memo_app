class ToppagesController < ApplicationController
  def index
    if logged_in?
      @users = User.all
      
      @category = Category.new
      @categories = Category.all
      
      @post = current_user.posts.build #formのための空の値
      @posts = current_user.feed_posts.order(id: :desc)
      
    end
  end
end