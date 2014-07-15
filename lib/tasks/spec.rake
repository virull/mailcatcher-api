Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList[ ENV['SPEC_FILES'] ].exclude( ENV['INTEGRATION_FILES'] )
end
task default: :spec
