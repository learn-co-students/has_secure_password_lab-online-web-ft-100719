class UsersController < ApplicationController
  def new
  end

  def create
    #binding.pry 
    @user = User.new(user_params)

    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Couldn't create account. Password and confirm must match"
      return redirect_to new_user_path
    end
  end

  def home
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
