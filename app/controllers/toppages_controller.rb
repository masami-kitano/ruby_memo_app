class ToppagesController < ApplicationController
  def index
    if logged_in?
      @category = Category.new
      @categories = Category.all
      
      @post = current_user.posts.build #formのための空の値
      # @posts = current_user.posts.order(id: :desc)
    end
  end
end