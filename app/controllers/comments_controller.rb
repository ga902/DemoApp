class CommentsController < ApplicationController
  before_action :current_user, only:[:create]
  def create
    @post= Post.find_by(user_id: params[:comment][:user_id], id:params[:comment][:post_id])
    
    @comment = @post.comment.build(comment_params)
    if @comment.save
      redirect_to root_path
    else
      render 'posts/show'
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body,:user_id)
    # params.require(:post).permit(:content)\
  end
end
