class MailLogger
  def self.write(message)
    LogMailer.send_log(message).deliver_now
  end
end
