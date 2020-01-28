class UsersController < ApplicationController

  def welcome
      @user = User.find_by(name: params[:user][:name]) 
    end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  

end
