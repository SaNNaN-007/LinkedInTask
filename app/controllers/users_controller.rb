class UsersController < ApplicationController
    before_action :authorize_admin, only: [:create]

    def index
        render json: User.all
    end

    def show
        render json: User.find(params[:id])
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private 

    def user_params
        params.permit(:email, :password)
    end

end
    