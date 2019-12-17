class UsersController < ApplicationController
    before_action :logged_in?, only: [:home]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to controller: 'users', action: 'home'
        else
            flash[:error] = @user.errors.full_messages
            redirect_to controller: 'users', action: 'new'
        end
    end

    def home
        @user = User.find_by_id(session[:user_id])
        render 'index'
    end

    def logged_in?
        if !session[:user_id]
            redirect_to controller: 'sessions', action: 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end