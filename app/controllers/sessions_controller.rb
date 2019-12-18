class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to "/"  
        end
    end

    def destroy
        if is_logged_in?
            session.clear
            redirect_to "/login"  
        end
    end

    def is_logged_in?
        !!session[:user_id]
    end
end
