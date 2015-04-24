# Encoding: utf-8
#
# Cookbook Name:: openstack_client
# Recipe:: default
#
# Copyright 2014, Paul Czarkowski
#

# Required to install fog

case node['platform_family']
when 'debian'
  node.override['apt']['compile_time_update'] = true
  include_recipe 'apt'

  node.set['build-essential']['compile_time'] = true
  include_recipe 'build-essential'
when 'redhat'
  include_recipe 'yum'
end

include_recipe 'xml::ruby'

chef_gem 'nokogiri' do
  version node['openstack_client']['nokogiri_version']
  action :upgrade
end

chef_gem 'fog' do
  version node['openstack_client']['fog_version']
  action :upgrade
end
