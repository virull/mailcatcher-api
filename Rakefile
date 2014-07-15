require 'rubygems'
require 'bundler/gem_tasks'
require 'rake/testtask'

ENV['SPEC_FILES']        = 'spec/**/*_spec.rb'
ENV['INTEGRATION_FILES'] = 'spec/integration/**/*_spec.rb'

Dir.glob('lib/tasks/*.rake').each { |task| load task }
