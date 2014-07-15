require_relative '../../spec_helper'

describe MailCatcher::API::Mailbox do
  describe '#initialize' do
    it 'configurable' do
      mailbox = MailCatcher::API::Mailbox.new
      expect(mailbox.server).to eq(MailCatcher::API.config.server)
    end
  end

  describe 'stubbed' do
    let(:server) { MailCatcher::API.config.server }
    let(:mailbox) { MailCatcher::API::Mailbox.new }

    after do
      remove_request_stub(@stub) if @stub
    end

    it '#count' do
      messages = FactoryGirl.attributes_for_list(:email, 3)
      @stub = stub_request(:get, "#{server}/messages")
        .to_return(status: 200, body: MultiJson.dump(messages), headers: {})
      expect(mailbox.count).to be 3
    end

    it '#refresh' do
      @stub = stub_request(:get, "#{server}/messages")
        .to_return(status: 200, body: MultiJson.dump(FactoryGirl.attributes_for_list(:email, 3)), headers: {})
      expect(mailbox.count).to be 3

      @stub = stub_request(:get, "#{server}/messages")
        .to_return(status: 200, body: MultiJson.dump(FactoryGirl.attributes_for_list(:email, 4)), headers: {})
      mailbox.refresh
      expect(mailbox.count).to be 4
    end
  end
end
