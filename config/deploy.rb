set :stage, :staging
set :application, 'Energymonitor'
set :repo_url, 'git@github.com:eriktiemens/energymonitor.git'
set :branch, 'master'
set :deploy_to, '/var/local/server'

role :all, %w{pi@192.169.1.11}

server '192.169.1.11', roles: %w{app}

desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end

desc "Check if agent forwarding is working"
task :forwarding do
  on roles(:all) do |h|
    if test("env | grep SSH_AUTH_SOCK")
      info "Agent forwarding is up to #{h}"
    else
      error "Agent forwarding is NOT up to #{h}"
    end
  end
end