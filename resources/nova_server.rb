#
# Cookbook Name:: openstack_client
# Resource:: nova_server
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

actions :create, :delete

default_action :create

BOOLEAN = [TrueClass, FalseClass]

attribute :openstack_username, kind_of: String, required: true
attribute :openstack_password, kind_of: String, required: true
attribute :openstack_tenant, kind_of: String, required: true
attribute :openstack_region, kind_of: String, default: 'RegionOne'
attribute :openstack_auth_url, kind_of: String, required: true
attribute :name, kind_of: String, name_attribute: true
attribute :id, kind_of: String, name_attribute: true
attribute :image, kind_of: String, required: true
attribute :flavor, kind_of: String

def initialize(*args)
  super
  @action = :create
end
