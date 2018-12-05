# Encoding: utf-8
name 'openstack_client'
maintainer 'openstack-chef'
maintainer_email 'openstack-discuss@lists.openstack.org'
license 'Apache2'
description 'Library cookbook to interact with OpenStack Clouds'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '12.0.0'

supports 'ubuntu', '>= 14.04'
supports 'centos', '>= 6.5'

depends 'apt', '~> 2.8'
depends 'build-essential', '~> 2.1.3'
depends 'xml', '~> 1.2.13'
depends 'yum', '~> 3.5.4'
