require_relative 'logger/severity'
require_relative 'logger/log_device'

class MultiLogger
  include Severity

  attr_reader :level

  def initialize(*logdevs, level: DEBUG)
    @level = level
    @logdevs = logdevs
  end

  def add(logdev, severity, message = nil)
    severity ||= UNKNOWN

    return true if logdev.nil? || severity < level

    logdev.write(format_message(format_severity(severity), Time.now, message))
    true
  end

  def info(&block)
    @logdevs.each do |logdev|
      add(LogDevice.new(logdev), INFO, &block)
    end
  end

  def warn(&block)
    @logdevs.each do |logdev|
      add(LogDevice.new(logdev), WARN, &block)
    end
  end

  def error(&block)
    @logdevs.each do |logdev|
      add(LogDevice.new(logdev), ERROR, &block)
    end
  end

  def fatal(&block)
    @logdevs.each do |logdev|
      add(LogDevice.new(logdev), FATAL, &block)
    end
  end

  def unknown(&block)
    @logdevs.each do |logdev|
      add(LogDevice.new(logdev), UNKNOWN, &block)
    end
  end

  private

  SEV_LABEL = %w(DEBUG INFO WARN ERROR FATAL ANY).freeze

  def format_severity(severity)
    SEV_LABEL[severity] || 'ANY'
  end

  def format_message(severity, datetime, msg)
    "[#{datetime.strftime("%Y-%m-%dT%H:%M:%S.%6N")}] #{severity} -- #{msg}\n"
  end
end
