desc 'Start the IRB console (short-cut alias: "c")'
task :console do
    sh 'irb -I lib -rubygems -r mailcatcher/api'
end
task c: :console
