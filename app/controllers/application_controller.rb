class ApplicationController < ActionController::API

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorize_admin 
        if current_user
            unless current_user.admin?
            render json: { error: 'Unauthorized' }, status: :unauthorized
            end
        else
            render json: { error: 'Not Logged In' }, status: :unauthorized
        end
    end
      
end
