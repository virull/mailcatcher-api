Rake::TestTask.new('spec:integration') do |t|
  t.test_files = FileList[ ENV['INTEGRATION_FILES'] ]
end
