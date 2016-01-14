role :app, %w(hosting_q3pp@titanium.locum.ru)
role :web, %w(hosting_q3pp@titanium.locum.ru)
role :db, %w(hosting_q3pp@titanium.locum.ru)

set :ssh_options, forward_agent: true
set :rails_env, :production
