class ToppagesController < ApplicationController
  def index
    if logged_in?
      @users = User.all
      
      @category = Category.new
      @categories = Category.all
      
      @post = current_user.posts.build
      
      @comment = current_user.comments.build
     
    end
  end
end