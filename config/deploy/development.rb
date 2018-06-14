role :app, %w{hoge@example.com}
task :ls do
  on roles(:app) do
    execute "ls"
  end

task :ruby_version do
  on roles(:app) do
    execute %[ruby -v]
  end
end
