#
# Cookbook Name:: openstack_client
# Resource:: swift
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

actions :create, :create_if_missing, :upload, :delete

default_action :create

BOOLEAN = [TrueClass, FalseClass]

attribute :openstack_username, kind_of: String, required: true
attribute :openstack_password, kind_of: String, required: true
attribute :openstack_tenant, kind_of: String, required: true
attribute :openstack_region, kind_of: String, default: 'RegionOne'
attribute :openstack_auth_url, kind_of: String, required: true
attribute :openstack_temp_url_key, kind_of: String
attribute :openstack_persistent, kind_of: BOOLEAN, default: false
attribute :openstack_service_name, kind_of: String
attribute :openstack_service_type, kind_of: String
attribute :openstack_endpoint_type, kind_of: String
attribute :file, kind_of: String, name_attribute: true
attribute :container, kind_of: String, required: true
attribute :object, kind_of: String
attribute :binmode, kind_of: BOOLEAN, default: false

attr_accessor :exists
attr_accessor :checksum
