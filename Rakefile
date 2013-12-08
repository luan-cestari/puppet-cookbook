SSH = 'ssh -A -l his -p 2222'

desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client}"
  sh "sudo su vagrant"
  sh "pull-updates"
end
