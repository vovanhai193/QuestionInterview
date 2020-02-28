class MultiLogger
  include Severity

  attr_reader :level

  def initialize(*logdevs, level: DEBUG)
    @level = level
    @logdevs = logdevs.map{ |logdev| LogDevice.new(logdev) }
  end

  def add(logdev, severity, message = nil)
    severity ||= UNKNOWN

    return true if logdev.nil? || severity < level

    logdev.write(format_message(format_severity(severity), Time.now, message))
    true
  end

  %w[info warn error fatal unknown].each do |method_name|
    define_method method_name do |message|
      @logdevs.each do |logdev|
        add(logdev, Severity.const_get(method_name.upcase), message)
      end
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
