class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = 'カテゴリーを追加しました'
      redirect_to root_url
    else
      @categories = Category.all
      flash.now[:danger] = 'カテゴリーの追加に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
