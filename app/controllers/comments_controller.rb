class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def index
    @comment_topics = current_user.comment_topics
  end

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = comment_params[:topic_id]
    @comment.user_comment = comment_params[:user_comment]
    
    #binding.pry
    if @comment.save
      redirect_to topics_path, success: 'コメントの投稿に成功しました'
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment, :topic_id)
  end
end
