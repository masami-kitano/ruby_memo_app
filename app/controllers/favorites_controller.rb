class FavoritesController < ApplicationController
  def create
    idea = Post.find(params[:post_id])
    current_user.like(idea)
    flash[:success] = 'いいね！しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    idea = Post.find(params[:post_id])
    current_user.unlike(idea)
    flash[:success] = 'いいね！を解除しました'
    redirect_back(fallback_location: root_path)
  end
end
