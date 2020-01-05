class SessionsController < ApplicationController 
    
    def new
    end 

    def create 
        @user = User.find_by(strong_params(:name))    
        return head(:forbidden) unless @user.authenticate(params[:user][:passwor])
        session[:user_id] = @user.id 
    end 

    def strong_params(*args)
        params.require(:user).permit(*args)
    end 
end 