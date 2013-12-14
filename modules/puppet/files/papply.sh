#!/bin/sh
sudo puppet apply /home/deploy/puppet-cookbook/manifests/site.pp --modulepath=/home/deploy/puppet-cookbook/modules/ $*
