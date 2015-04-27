#
# Cookbook Name:: openstack_client
# Provider:: nova_server
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

include Openstack::Client::Nova

def whyrun_supported?
  true
end

action :create do
  require 'fog'
  name = new_resource.name
  image = new_resource.image
  flavor = new_resource.flavor

  ruby_block 'create a server' do
    block do
      nova.create_server(name, image, flavor)
    end
  end
  new_resource.updated_by_last_action(true)
end

action :delete do
  require 'fog'
  id = new_resource.id

  ruby_block 'delete a server' do
    block do
      nova.delete_server(id)
    end
  end
  new_resource.updated_by_last_action(true)
end
