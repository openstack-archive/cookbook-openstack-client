#
# Cookbook Name:: openstack_client
# Provider:: _example_nova
# Author:: JJ Asghar
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

include_recipe 'openstack_client::default'

openstack_client_nova_server 'test1' do
  openstack_username 'USERNAME'
  openstack_password 'PASSWORD'
  openstack_auth_url 'https://mybackendopenstack:35357/v2.0/tokens'
  openstack_tenant 'Project'
  openstack_region 'region-a'
  image 'bec3cab5-4722-40b9-a78a-3489218e22fe'
  flavor '101'
  action :create
end

openstack_client_nova_server 'test' do
  openstack_username 'USERNAME'
  openstack_password 'PASSWORD'
  openstack_auth_url 'https://mybackendopenstack:35357/v2.0/tokens'
  openstack_tenant 'Project'
  openstack_region 'region-a'
  id 'c6ab5354-baa4-4ea3-af27-ef3eb874472e'
  action :delete
end
