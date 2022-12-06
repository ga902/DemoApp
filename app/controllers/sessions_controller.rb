class SessionsController < ApplicationController
  def login
  end
  def create
    user = User.find_by(email:params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'login'
      end
  end
  def destroy
    session.delete(:user_id)
    #log_out
    redirect_to root_url
  end
end
