desc 'stop rails'
task :stop do
    puts "Recherche du pid ..."
    pid_file = 'tmp/pids/server.pid'
    pid = File.read(pid_file).to_i
    puts pid
    Process.kill 9, pid
    File.delete pid_file
end