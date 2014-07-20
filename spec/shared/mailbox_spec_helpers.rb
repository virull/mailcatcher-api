module MailboxSpecHelpers
  def self.included spec_class
    spec_class.class_eval do

      let(:mailbox_server) { MailCatcher::API.config.server }
      let(:mailbox) { MailCatcher::API::Mailbox.new }

      def stub_mailbox(message_count = 3)
        @mailbox_size = message_count

        @mailbox_email_index = FactoryGirl.build_list(:email_index, @mailbox_size)
        @stub_email_index = stub_request(:get, "#{mailbox_server}/messages")
          .to_return(status: 200, body: MultiJson.dump(@mailbox_email_index))

        @mailbox_email = FactoryGirl.attributes_for(:email)
        @stub_email = stub_request(:get, /#{ Regexp.quote(mailbox_server) }\/messages\/\d+\.json/)
          .to_return(status: 200, body: MultiJson.dump(@mailbox_email))
      end

      def unstub_mailbox
        remove_request_stub(@stub_email_index)
        remove_request_stub(@stub_email)
      end
    end
  end
end
