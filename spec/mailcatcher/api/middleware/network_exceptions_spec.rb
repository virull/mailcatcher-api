require_relative '../../../spec_helper'

describe MailCatcher::API::Middleware::NetworkExceptions do

  let(:mailbox) { MailCatcher::API::Mailbox.new }

  after do
    MailCatcher::API.reset_config
    remove_request_stub(@stub) if @stub
  end

  it 'error: connection timeout' do
    api_server = 'http://8.8.8.8:3000'
    url = /#{ Regexp.quote(api_server) }.*/
    MailCatcher::API.config.server = api_server
    @stub = stub_request(:get, url).to_timeout
    expect { mailbox.messages }.to raise_error(MailCatcher::API::Error::Timeout)
    assert_requested(:get, url, times: 1)
  end

  it 'error: connection failed' do
    MailCatcher::API.config.server = 'http://not-existing-server.com:3000'
    expect { mailbox.messages }.to raise_error(MailCatcher::API::Error::Connection)
  end
end
