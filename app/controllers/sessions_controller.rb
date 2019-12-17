class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'home'
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end