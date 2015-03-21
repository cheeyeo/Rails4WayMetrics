require "mongoid"
require "jquery-rails"
require "mongo_metrics/engine"
require "active_support/notifications"
require "mongo_metrics/csv_streamer"

module MongoMetrics
  EVENT = "process_action.action_controller"

  ActiveSupport::Notifications.subscribe EVENT do |*args|
    MongoMetrics::Metric.store!(args) unless mute?
  end

  def self.mute!
    Thread.current["mongo_metrics.mute"] = true
    yield
  ensure
    Thread.current["mongo_metrics.mute"] = false
  end

  def self.mute?
    Thread.current["mongo_metrics.mute"] || false
  end
end
