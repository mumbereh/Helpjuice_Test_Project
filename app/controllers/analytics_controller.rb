class AnalyticsController < ApplicationController
  def top_searches
    @top_searches = Search.group(:query).order('count_id DESC').limit(10).count(:id)
  end
end
