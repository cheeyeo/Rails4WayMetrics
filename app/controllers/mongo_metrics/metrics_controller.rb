module MongoMetrics
  class MetricsController < ApplicationController

    def index
      @metrics = Metric.all
    end

    def destroy
      @metric = Metric.find(params[:id])
      @metric.destroy
      redirect_to root_path
    end
  end
end
