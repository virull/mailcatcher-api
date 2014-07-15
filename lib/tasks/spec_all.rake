Rake::TestTask.new('spec:all') do |t|
  t.test_files = FileList[ ENV['SPEC_FILES'] ]
end
