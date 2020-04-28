class RatingsController < ApplicationController

    def index
        @ratings = Rating.all
        # Create model json helpers
        # render json: @ratings.all_json
        render json: @ratings.user_ratings
    end

    def show
        @rating = Rating.find(params[:id])
        render json: @rating.user_ratings
    end

    def create
        @rating = Rating.new(rating_params)
        if @rating && @rating.valid?
            @rating.save
            render json: { rating: @rating }, status: :created
        else
            render json: { errors: @rating.errors.full_messages }, status: :not_acceptable
        end
    end
  
    def update
        @rating = Rating.find(params[:id])
        if @rating.update(rating_params)
            render json: { rating: @rating }, status: :accepted
        else
            render json: { errors: @rating.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        @rating = Rating.find(params[:id])
        if @rating
            @rating.destroy
            render json: {}, status: :no_content
        else
            render json: { errors: @rating.errors.full_messages }, status: :unprocessible_entity
        end
    end
    
    private
    def rating_params
        # id,user_id,rater_id,rating,rated_at,created_at,updated_at
        params.require(:rating).permit(:rating, :rated_at, :user_id, :rater_id)
        # params.permit(:rating, :rater_id)
    end
    
end