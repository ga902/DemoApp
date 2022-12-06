class UsersController < ApplicationController
  before_action :current_user, only:[:show,:home]
  def new
    @user =User.new
  end
  def create
    # @user=User.new(params.require(:user).permit(:name, :email, :password, :confirm_password))
    @user = User.new(user_params)
    if @user.save
      flash[:success]="User Created Successfully"
      redirect_to @user
    else
      render 'new'
    end
  end
  def show
    @user=User.find(params[:id])
    # @post = current_user.post.build
    @id=@user.id
    @posts= @user.post.includes(:comment)
    # @posts.each do |post|
    #   @comment = post.comment.build
    # end
  end
  def home
    if session[:user_id]
    @user=User.find(session[:user_id])
    @post = current_user.post.build
    end
  end
  def index
    @users=User.all  
  end
  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
