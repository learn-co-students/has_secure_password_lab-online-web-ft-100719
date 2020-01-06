module ApplicationHelper

    def current_user
        User.find(session[:user_id])
    end

    def name
        current_user.name
    end

end