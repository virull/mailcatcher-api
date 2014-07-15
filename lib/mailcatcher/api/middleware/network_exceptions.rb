module MailCatcher
  module API
    module Middleware
      class NetworkExceptions < ::Faraday::Middleware
        def call(env)
          @app.call(env)
        rescue ::Faraday::Error::TimeoutError
          raise Error::Timeout, $!
        rescue
          raise Error::Connection, $!
        end
      end
    end
  end
end

Faraday::Request.register_middleware network_exception: MailCatcher::API::Middleware::NetworkExceptions
