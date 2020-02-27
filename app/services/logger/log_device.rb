module Logger
  class LogDevice
    attr_reader :dev

    def initialize(log = nil)
      set_dev(log)
    end

    def write(message)
      @dev.write(message)
    rescue Exception => ignored
      puts "log writing failed. #{ignored}"
    end

    private

    def set_dev(log)
      if log.respond_to?(:write)
        @dev = log
      else
        @dev = open_logfile(log)
        @dev.sync = true
      end
    end

    def open_logfile(filename)
      begin
        File.open(filename, (File::WRONLY | File::APPEND))
      rescue Errno::ENOENT
        create_logfile(filename)
      end
    end

    def create_logfile(filename)
      begin
        logdev = File.open(filename, (File::WRONLY | File::APPEND | File::CREAT | File::EXCL))
        logdev.sync = true
      rescue Errno::EEXIST
        logdev = open_logfile(filename)
        logdev.sync = true
      end
      logdev
    end
  end
end
