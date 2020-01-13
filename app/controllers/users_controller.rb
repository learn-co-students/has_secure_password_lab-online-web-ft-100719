class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
        if @user.save
            session[:user_id] = @user.id
            redirect_to :welcome
        else
            redirect_to :new_user
        end
    end
end