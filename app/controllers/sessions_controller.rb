class SessionsController < ApplicationController
  def new
  end

  def create
  
    if params[:user][:name].nil? || params[:user][:name].empty? || params[:user][:password].empty?
      flash[:error] = "Username cannot be empty"
      redirect_to login_path
    else
      user = User.find_by(name: params[:user][:name])
      authenticated = user.try(:authenticate, params[:user][:password])
      return redirect_to login_path unless authenticated
      session[:user_id] = user.id
      session[:name] = params[:user][:name] 
    end
  end

  def destroy
    session.delete(:name)
    redirect_to login_path
  end
end
