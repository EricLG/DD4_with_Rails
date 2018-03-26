desc 'start Waukeen'
task :start do
  Process.exec("rails s -b 0.0.0.0 -d")
end
