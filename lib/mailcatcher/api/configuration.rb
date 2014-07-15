module MailCatcher
  module API
    class Configuration
      attr_accessor :server

      def initialize
        @server = 'http://127.0.0.1:1080'
      end
    end
  end
end
