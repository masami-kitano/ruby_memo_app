class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:update, :destroy]
  
  def create
    @comments = current_user.comments.build(comments_params)
    if @comments.save
      flash[:success] = 'コメントを追加しました。'
      redirect_to root_url
    else
      flash[:danger] = 'コメントを追加できませんでした。'
      render 'toppages/index'
    end
  end

  def update
    @comment.update
    flash[:success] = 'コメントを更新しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
