class SearchController < ApplicationController
  def index
  end

  def create
    query = params[:query]
    SearchQuery.create(query: query) unless query.blank?
    head :ok
  end

  def analytics
    @queries = SearchQuery.select(:query).distinct.group(:query).count
  end
end
