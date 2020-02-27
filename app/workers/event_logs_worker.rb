class EventLogsWorker
  include Sidekiq::Worker

  def perform(event_name, timestamp)
    EventLog.create(event_name: event_name, timestamp: timestamp)
  end
end
