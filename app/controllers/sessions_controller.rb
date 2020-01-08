class SessionsController < ApplicationController

    def new 

    end 

    def create 
        @user = User.find_by(name: params[:user][:name])
        if !@user.nil? && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id
        else 
            return head(:forbidden)
        end 
    end 
end
