class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:update, :destroy]
  
  def create
    @categories = Category.all
    
    @post = current_user.posts.find_or_create_by(id: params[:id])
    
    if @post.new_record?
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = 'アイデアを投稿しました'
        redirect_to root_url
      else
        @posts = current_user.posts.order(id: :desc)
        flash.now[:danger] = 'アイデアの投稿に失敗しました。'
        render 'toppages/index'
      end
    else
      @post.update(post_params)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'アイデアを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
  
  def correst_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
