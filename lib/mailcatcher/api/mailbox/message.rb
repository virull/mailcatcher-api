require 'uri'
require 'mail'

module MailCatcher
  module API
    class Mailbox
      class Message
        attr_reader :id, :raw
        attr_reader :message_id, :date
        attr_reader :from, :to, :subject, :body
        attr_reader :mime_type, :charset, :content_type

        def initialize(msg)
          @id = msg['id'].to_i
          @raw = msg['source']

          mail = Mail.new(@raw)
          @message_id = mail.message_id
          @date = mail.date
          @from = mail.from
          @to = mail.to
          @subject = mail.subject
          @body = mail.body.raw_source
          @mime_type = mail.mime_type
          @charset = mail.charset
          @content_type = mail.content_type
        end

        def links
          @links ||= URI.extract(@body).select { |s| s.start_with? 'http' }
        end
      end
    end
  end
end
