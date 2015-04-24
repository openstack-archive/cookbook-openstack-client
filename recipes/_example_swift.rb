#
# Cookbook Name:: openstack_client
# Provider:: _example_swift
# Author:: Paul Czarkowski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

file '/tmp/bacon' do
  owner 'root'
  group 'root'
  mode '0755'
  content 'bacon bacon bacon bacon'
  action :create
end

openstack_swift_object 'upload_file' do
  openstack_username 'admin'
  openstack_password 'devstack'
  openstack_tenant 'admin'
  openstack_auth_url 'http://104.130.171.127:5000/v2.0/tokens'
  container 'potato'
  file '/tmp/bacon'
  action :upload
end

file '/tmp/bacon' do
  owner 'root'
  group 'root'
  mode '0755'
  action :delete
end

openstack_swift_object 'download_file' do
  openstack_username 'admin'
  openstack_password 'devstack'
  openstack_tenant 'admin'
  openstack_auth_url 'http://104.130.171.127:5000/v2.0/tokens'
  container 'potato'
  file '/tmp/bacon'
  action :create
end

openstack_swift_object 'delete_file' do
  openstack_username 'admin'
  openstack_password 'devstack'
  openstack_tenant 'admin'
  openstack_auth_url 'http://104.130.171.127:5000/v2.0/tokens'
  container 'potato'
  file '/tmp/bacon'
  action :delete
end
