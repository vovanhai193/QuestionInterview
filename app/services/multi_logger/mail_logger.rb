class MultiLogger
  class MailLogger
    def self.write(message)
      LogMailer.send_log(message).deliver
    end
  end
end
