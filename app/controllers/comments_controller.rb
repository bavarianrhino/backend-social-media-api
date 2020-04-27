class CommentsController < ApplicationController

    def index
        @comments = Comment.all
        # Create model json helpers
        # render json: @comments.all_json
        render json: @comments
    end

    def show
        @comment = Comment.find(params[:id])
        render json: @comment
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment && @comment.valid?
            @comment.save
            render json: { comment: @comment }, status: :created
        else
            render json: { errors: @comment.errors.full_messages }, status: :not_acceptable
        end
    end
  
    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            render json: { comment: @comment }, status: :accepted
        else
            render json: { errors: @comment.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment
            @comment.destroy
            render json: {}, status: :no_content
        else
            render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
        end
    end
    
    private
    def comment_params
        #id,user_id,post_id,message,commented_at,created_at,updated_at
        # params.require(:comment).permit(:message)
        # params.permit(:message)
    end

end