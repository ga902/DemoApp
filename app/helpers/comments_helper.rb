module CommentsHelper
  def comments_name(comments)
    @user_name= comments.user.name
    return @user_name
  end
end
