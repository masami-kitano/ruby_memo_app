class ToppagesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
    
    if logged_in?
      @post = current_user.posts.build #formのための空の値
      @posts = current_user.posts.order(id: :desc)
    end
  end
end