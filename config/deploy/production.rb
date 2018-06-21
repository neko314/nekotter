set :stage, :production

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "nekotter.tk", user: "keiko", roles: %w{app db web}, my_property: :my_value
# server "160.16.109.81", user: "keiko", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}


# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.


role :web ,%W{deploy@160.16.109.81:26075}
 role :app, %w{deploy@160.16.109.81:26075}
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
  set :ssh_options, {
    keys: %w(/Users/keiko/.ssh/client_rsa),
    port: 26075,
    # forward_agent: true,
 #    # auth_methods: false,
  }
#
# The server-based syntax can be used to override options:
# server "nekotter.tk",
# user: "keiko",
# roles: %w{web app},
# ssh_options: {
#    user: "keiko", # overrides user setting above
#   port: 26075,
#   keys: %w(/home/keiko/.ssh/id_rsa),
#   forward_agent: false,
#   # auth_methods: %w(publickey password),
#   # password: "please use keys"
# }

desc "Upload secrets.yml to the shared/config directory."
task :secrets_yml do
  unless File.exist?('tmp/secrets.yml')
    secrets = { fetch(:stage).to_s =>
      { 'secret_key_base' => SecureRandom.hex(64) } }
    File.open('tmp/secrets.yml', 'w') do |f|
      f.write secrets.to_yaml
    end
  end

  on roles(:app) do
    unless test "[ -f #{shared_path}/config/secrets.yml ]"
      unless test "[ -d #{shared_path}/config ]"
        execute "/bin/mkdir -p #{shared_path}/config/"
      end
      upload! "tmp/secrets.yml", "#{shared_path}/config/secrets.yml"
    end
  end
end
