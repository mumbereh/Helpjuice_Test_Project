class SearchesController < ApplicationController
  def index
    @searches = Search.all.order(created_at: :desc).limit(10)
  end

  def create
    @search = Search.new(search_params)
    @search.ip_address = request.remote_ip

    if @search.query.length >= 5 && @search.save
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: 'Query is too short. Please enter at least 5 characters.' }, status: :unprocessable_entity
    end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
