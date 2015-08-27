#
# Cookbook Name:: openstack_client
# Library:: storage
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

module Openstack
  module Client
    # this is required to shut up rubocop
    module Swift
      include Openstack::Client

      def swift
        @swift ||= Fog::Storage.new(provider: 'openstack',
                                    openstack_username: new_resource.openstack_username,
                                    openstack_api_key: new_resource.openstack_password,
                                    openstack_auth_url: new_resource.openstack_auth_url,
                                    openstack_tenant: new_resource.openstack_tenant,
                                    openstack_region: new_resource.openstack_region,
                                    openstack_temp_url_key: new_resource.openstack_temp_url_key,
                                    openstack_persistent: new_resource.openstack_persistent,
                                    openstack_service_name: new_resource.openstack_service_name,
                                    openstack_service_type: new_resource.openstack_service_type,
                                    openstack_endpoint_type: new_resource.openstack_endpoint_type
                                   )
      end
    end
  end
end
