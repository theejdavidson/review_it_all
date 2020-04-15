class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, include: [:reviews]
    end

    def show
        user = User.find(params[:username])
    end

    def create
        p params
        user = User.new(user_params)
        if user.save
            puts user
            render json: user
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:username)
    end
end
