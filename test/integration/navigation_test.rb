require "test_helper"
class NavigationTest < ActionDispatch::IntegrationTest
  setup do
    MongoMetrics::Metric.delete_all
  end

  test "can visualize notifications" do
    get main_app.home_foo_path
    get main_app.home_bar_path
    get main_app.home_baz_path

    get "/mongo_metrics"
    # get mongo_metrics.metrics_path
    assert_match "Path: /home/foo", response.body
    assert_match "Path: /home/bar", response.body
    assert_match "Path: /home/baz", response.body
  end

  test "can destroy notifications" do
    get main_app.home_foo_path
    metric = MongoMetrics::Metric.first
    # delete metric_path(metric)
    delete "/mongo_metrics/metrics/#{metric.id}"
    assert_empty MongoMetrics::Metric.where(id: metric.id)
  end
end

