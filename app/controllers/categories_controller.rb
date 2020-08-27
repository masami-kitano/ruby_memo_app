class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_category, only: [:edit, :update, :destroy]
  
  def create
    @users = User.all
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = 'カテゴリーを追加しました'
      redirect_back(fallback_location: root_path)
    else
      @categories = Category.all
      flash[:danger] = 'カテゴリーの追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = @category.name + 'を削除しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'アイデアが存在するためカテゴリーを削除できません。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end
