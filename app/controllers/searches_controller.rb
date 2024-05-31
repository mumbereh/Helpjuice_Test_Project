class SearchesController < ApplicationController
    def index
      @searches = Search.all.order(created_at: :desc).limit(10)
    end
  
    def create
      @search = Search.new(search_params)
      @search.ip_address = request.remote_ip
  
      if @search.save
        render json: { status: 'success' }
      else
        render json: { status: 'error', message: @search.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    private
  
    def search_params
      params.require(:search).permit(:query)
    end
  end
  