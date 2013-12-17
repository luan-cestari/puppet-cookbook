SSH = 'ssh -A -l deploy'
REPO = 'git@github.com:HinrichSager/puppet-cookbook.git'

desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client} pull-updates"
end

desc "Bootstrap Puppet on ENV['CLIENT'] with hostname ENV['HOSTNAME']"
task :bootstrap do
  client = ENV['CLIENT']
  hostname = ENV['HOSTNAME'] || client
  commands = <<BOOTSTRAP
    sudo hostname #{hostname} && \
    wget apt.puppetlabs.com/puppetlabs-release-wheezy.deb && \
    sudo dpkg -i puppetlabs-release-wheezy.deb && \
    sudo apt-get update && sudo apt-get -y install git puppet && \
    rm -rf puppet-cookbook && \
    git clone #{REPO} puppet-cookbook && \
    sudo puppet apply --modulepath=/home/deploy/puppet-cookbook/modules /home/deploy/puppet-cookbook/manifests/site.pp
BOOTSTRAP
  sh "#{SSH} #{client} '#{commands}'"
end
