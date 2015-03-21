module MongoMetrics
  class MetricsController < ApplicationController

    def index
      @metrics = Metric.all
      respond_to do |format|
        format.html
        format.json
        format.csv{ render csv: @metrics }
      end
    end

    def destroy
      @metric = Metric.find(params[:id])
      @metric.destroy
      redirect_to root_path
    end
  end
end
