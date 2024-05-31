require "test_helper"

class AnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get top_searches" do
    get analytics_top_searches_url
    assert_response :success
  end
end
