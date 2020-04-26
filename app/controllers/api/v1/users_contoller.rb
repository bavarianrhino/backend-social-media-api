class API::V1::UsersController < ApplicationController

    def index
        @users = User.all
        # Create model json helpers
        # render json: @users.all_json
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user && @user.valid?
            # logic to check and call github api before save
            @user.save
            render json: { user: @user }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :not_acceptable
        end
    end
  
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: { user: @user }, status: :accepted
        else
            render json: { errors: @user.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: {}, status: :no_content
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
        end
    end
    
    private
    def user_params
        # id,email,name,github_username,registered_at,created_at,updated_at
        # params.require(:user).permit(:name, :email, :user_id)
        # params.permit(:name, :email)
    end

end