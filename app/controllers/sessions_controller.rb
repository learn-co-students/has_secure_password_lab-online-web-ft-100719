class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    if params[:user][:name].nil? || params[:user][:name].empty? || params[:user][:password].empty?
      flash[:error] = "Username cannot be empty"
      redirect_to login_path
    else
      binding.pry
      user = User.find_by(name: params[:user][:name])
      authenticated = user.try(:authenticate, params[:user][:password])
      redirect_to login_path unless authenticated
      binding.pry
      session[:user_id] = user.id
      session[:name] = params[:user][:name]
      binding.pry
    end
  end

  def destroy
    session.delete(:name)
    redirect_to login_path
  end
end
