desc "Restarts Waukeen"
task :restart do
  Rake::Task[:stop].invoke
  Rake::Task[:start].invoke
end
