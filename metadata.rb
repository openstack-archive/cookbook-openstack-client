# Encoding: utf-8
name 'openstack-client'
maintainer 'openstack-chef'
maintainer_email 'opscode-chef-openstack@googlegroups.com'
license 'Apache2'
description 'Library cookbook to interact with Openstack Clouds'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '10.0.1'

supports 'ubuntu', '>= 12.04'
%w(build-essential apt xml).each do |ckbk|
  depends ckbk
end
