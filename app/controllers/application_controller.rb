class ApplicationController < ActionController::Base
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    else
      redirect_to login_path
    end
  end
  # def correct_user
  #   unless params[:user_id]!=session[:user_id] ?
  #     flash[:danger] = "You can't visit this page."
      
  #   end
  # end
end
