module MailCatcher
  module API
    module Error
      class Connection < StandardError; end
      class Timeout < Connection; end
    end
  end
end
