class PostsController < ApplicationController
  before_action :current_user, only:[:create]
  def create
    # current_user.microposts.build(micropost_params)
      @post = current_user.post.build(micropost_params)
     
      if @post.save
        flash[:success] = "Micropost created!"
        redirect_to users_path
      else
        @post
         render 'users/show'
      end
  end
  def show
    @post=Post.find(params[:id])
    # @current_user=current_user
    @id=@post.user_id
    @post_id=@post.id
    @comment = @post.comment.build
  end
  private
    
  def micropost_params
    params.require(:post).permit(:context)
  end
end
