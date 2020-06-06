class ToppagesController < ApplicationController
  def index
    @category = current_user.categories.build
    @categories = Category.all
  end
end