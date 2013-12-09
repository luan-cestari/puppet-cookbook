#!/bin/sh
sudo su vagrant
cd /home/vagrant/puppet-cookbook
git pull && /usr/local/bin/papply
