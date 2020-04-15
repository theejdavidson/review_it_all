class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        if params[:username]
            user = User.find(params[:username])
        else
            user = User.find(params[:id])
        end
        render json: user
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
