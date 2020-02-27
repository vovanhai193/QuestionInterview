class Api::EventLogsController < ApplicationController
  def create
    if params[:event_name] && params[:timestamp]
      EventLogsWorker.perform_async(params[:event_name], params[:timestamp])
      render json: {}
    else
      render json: {error: "No parameter"}, status: :bad_request
    end
  end
end
