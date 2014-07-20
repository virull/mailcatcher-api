require 'bundler'

Bundler.setup
Bundler.require

require 'minitest/autorun'
require 'minitest/spec'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'rspec/expectations/minitest_integration'

require 'factory_girl'
FactoryGirl.find_definitions

require 'webmock/minitest'
WebMock.allow_net_connect!

Dir[File.join(__dir__, 'shared/**/*.rb')].each { |f| require f }
