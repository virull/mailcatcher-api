module MailCatcher
  module API
    class Mailbox
      attr_reader :server

      def initialize
        @server = MailCatcher::API.config.server

        @connection = Faraday.new(url: @server) do |faraday|
          faraday.request :network_exception
          faraday.adapter :net_http
        end

        @messages_index = nil
        @messages = nil
      end

      def refresh
        load_messages_index
        load_messages unless @messages.nil?
      end

      def count
        messages_index.count
      end

      def messages
        @messages ||= load_messages
      end

      private

      def load_messages_index
        @messages_index = MultiJson.load(@connection.get('/messages').body)
      end

      def messages_index
        @messages_index ||= load_messages_index
      end

      def load_messages
        @messages = messages_index.map do |msg|
          response = @connection.get("/messages/#{ msg['id'] }.json")
          API::Message.new(MultiJson.load(response.body)['source'])
        end
      end
    end
  end
end
