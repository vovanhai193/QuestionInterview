class Api::EventLogsController < ApplicationController
  def create
    if params[:event_name] && params[:timestamp]
      EventLogsWorker.perform_async(params[:event_name], params[:timestamp])
      render json: {status: :ok}
    else
      render json: {status: :bad_request}
    end
  end
end
