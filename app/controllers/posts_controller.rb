class PostsController < ApplicationController

    def index
        @posts = Post.all
        # Create model json helpers
        # render json: @posts.all_json
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.new(post_params)
        if @post && @post.valid?
            @post.save
            render json: { post: @post }, status: :created
        else
            render json: { errors: @post.errors.full_messages }, status: :not_acceptable
        end
    end
  
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render json: { post: @post }, status: :accepted
        else
            render json: { errors: @post.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post
            @post.destroy
            render json: {}, status: :no_content
        else
            render json: { errors: @post.errors.full_messages }, status: :unprocessible_entity
        end
    end
    
    private
    def post_params
        # id, title, body, user_id,  posted_at, created_at, updated_at
        # params.require(:post).permit(:title, :body)
        # params.permit(:title, :body)
    end
    
end