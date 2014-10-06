# Encoding: utf-8
#
# Cookbook Name:: openstack-client
# Recipe:: default
#
# Copyright 2014, Paul Czarkowski
#

# Required to install fog

if platform_family?('debian')
  node.override['apt']['compile_time_update'] = true
  include_recipe 'apt'
end

node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'

chef_gem 'nokogiri' do
  version node['openstack-client']['nokogiri_version']
  action :upgrade
end

include_recipe 'xml::ruby'

chef_gem 'fog' do
  version node['openstack-client']['fog_version']
  action :upgrade
end

# Load fog for the cloud_monitoring library
# https://sethvargo.com/using-gems-with-chef/
require 'fog'
