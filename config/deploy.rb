require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
#require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

env = ENV['on'] || 'production'

set :domain, '13.126.244.139'
set :deploy_to, '/home/ubuntu/we_care'
set :repository, 'git@api:joshsoftware/we_care.git'
set :branch, ENV['branch'] || 'main'
set :rvm_path, '/usr/local/rvm/scripts/rvm'
set :rails_env, env
set :user, 'ubuntu'

set :shared_dirs, fetch(:shared_dirs, []).push('public/assets')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/master.key', 'config/secrets.yml', 'config/storage.yml', '.env')

task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-1.9.3-p125@default'
  # invoke :'rbenv local', '2.7.3'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0 --skip-existing}
  command %[touch "#{fetch(:shared_path)}/config/master.key"]
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
  command %[touch "#{fetch(:shared_path)}/config/storage.yml"]
  command %[touch "#{fetch(:shared_path)}/.env"]
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end
