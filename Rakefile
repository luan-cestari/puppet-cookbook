SSH = 'ssh -A -l his -p 2222'

desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH}"
  sh "sudo su vagrant"
  sh "#{client} pull-updates"
end
