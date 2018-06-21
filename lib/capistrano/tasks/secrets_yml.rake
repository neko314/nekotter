# namespace :deploy do
#   desc "Upload credentials.yml to the shared/config directory."
#   task :credentials_yml do
#     unless File.exist?('config/credentials.yml')
#       credentials = { fetch(:stage).to_s =>
#         { 'secret_key_base' => SecureRandom.hex(64) } }
#       File.open('credentials.yml', 'w') do |f|
#         f.write credentials.to_yaml
#       end
#     end
#
#     on roles(:app) do
#       unless test "[ -f #{shared_path}/config/credentials.yml ]"
#         unless test "[ -d #{shared_path}/config ]"
#           execute "/bin/mkdir -p #{shared_path}/config/"
#         end
#         upload! "config/credentials.yml", "#{shared_path}/config/credentials.yml"
#       end
#     end
#   end
# end
