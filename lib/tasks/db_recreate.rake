desc 'Recreate DB from drop to seed'
task :db_recreate do
  Process.exec("rake db:drop db:create db:migrate db:seed")
end
