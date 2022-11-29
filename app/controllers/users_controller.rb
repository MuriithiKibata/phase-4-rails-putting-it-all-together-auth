class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_errors
    def create
        user = User.create!(permitted)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :created
        else
            render json: {error: "User not Found"}, status: :unauthorized
        end
    end

    private

    def permitted
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    def invalid_errors
        render json: {errors: ["User not Found"]}, status: :unprocessable_entity
    end

end
