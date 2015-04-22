# Encoding: utf-8
name 'openstack-client'
maintainer 'openstack-chef'
maintainer_email 'opscode-chef-openstack@googlegroups.com'
license 'Apache2'
description 'Library cookbook to interact with Openstack Clouds'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '11.0.0'

supports 'ubuntu', '>= 14.04'
supports 'centos', '>= 6.5'

depends 'apt', '~> 2.6.1'
depends 'build-essential', '~> 2.1.3'
depends 'xml', '~> 1.2.13'
depends 'yum', '~> 3.5.4'
