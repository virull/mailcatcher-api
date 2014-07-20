require_relative '../../../spec_helper'

describe MailCatcher::API::Mailbox::MessageCollection do
  include MailboxSpecHelpers

  let(:collection) { MailCatcher::API::Mailbox::MessageCollection.new }

  before { stub_mailbox }
  after { unstub_mailbox }

  it 'enumerable' do
    expect(collection).to be_an(Enumerable)
    expect(collection).to respond_to :each
    expect(collection).to respond_to :count
    expect(collection).to respond_to :sort
    expect(collection).to respond_to :grep
    expect(collection).to respond_to :select
  end

  it 'count' do
    skip
  end
end
