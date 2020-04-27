class LogsController < ApplicationController

    def index
        @logs = Log.all
        # Create model json helpers
        # render json: @logs.all_json
        render json: @logs
    end

    def show
        @log = Log.find(params[:id])
        render json: @log
    end

    def create
        @log = Log.new(log_params)
        if @log && @log.valid?
            @log.save
            render json: { log: @log }, status: :created
        else
            render json: { errors: @log.errors.full_messages }, status: :not_acceptable
        end
    end
  
    def update
        @log = Log.find(params[:id])
        if @log.update(log_params)
            render json: { log: @log }, status: :accepted
        else
            render json: { errors: @log.errors.full_messages }, status: :not_acceptable
        end
    end

    def destroy
        @log = Log.find(params[:id])
        if @log
            @log.destroy
            render json: {}, status: :no_content
        else
            render json: { errors: @log.errors.full_messages }, status: :unprocessible_entity
        end
    end
    
    private
    def log_params
        
    end

end