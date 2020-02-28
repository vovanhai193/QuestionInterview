class LogMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_log message
    @message = message
    mail(to: "maillogger@example.com", subject: 'Logger')
  end
end
