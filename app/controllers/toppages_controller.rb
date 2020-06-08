class ToppagesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end
end