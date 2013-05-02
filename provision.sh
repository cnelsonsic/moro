#!/bin/bash -x

exec > >(tee /var/log/user-data.log)

apt-get --yes --quiet update
apt-get --yes --quiet install puppet-common

pushd /vagrant # If it doesn't exist, just hang out in the cwd. ;)

puppet apply --modulepath=modules/ manifests/init.pp

popd
