class SessionsController < ApplicationController
  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
      if user
      puts "create is hit"

    # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error = 'wrong username or password'
      render :new
  end
end

def destroy
  session[:user_id] = nil
  redirect_to '/login'
end
end

