class RecipesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_errors
    before_action :authorize
    def index   
    render json:  Recipe.all
    end

    def create
        user = User.find_by(id: session[:user_id])
        recipe = Recipe.create!(user_id: user.id, title: permitted_params[:title],  instructions: permitted_params[:instructions], minutes_to_complete: permitted_params[:minutes_to_complete])
        render json: recipe, status: :created
    
    end

    private
    def authorize
     render json: {errors: ["User Not Found"]}, status: :unauthorized unless session.include? :user_id
        end 

        def permitted_params
            params.permit(:title, :instructions, :minutes_to_complete)
        end
        def invalid_errors
            render json: {errors: ["User not Found"]}, status: :unprocessable_entity
        end
    end
