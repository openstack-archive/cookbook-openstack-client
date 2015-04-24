#
# Cookbook Name:: openstack_client
# Provider:: swift
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

require 'tempfile'
require 'chef/digester'

include Openstack::Client::Swift

def whyrun_supported?
  true
end

def load_current_resource
  @current_resource = Chef::Resource::OpenstackSwiftObject.new(@new_resource.name)
  @current_resource.file(@new_resource.file)

  if ::File.exist?(@current_resource.file)
    @current_resource.exists = true
    @current_resource.checksum = Chef::Digester.checksum_for_file(@current_resource.file)
  else
    @current_resource.exists = false
    new_resource.updated_by_last_action(true)
  end
  @current_resource
end

action :create do
  f = Tempfile.new('download')

  f.binmode if new_resource.binmode

  directory = get_directory(new_resource.container)
  directory.files.get(object(new_resource)) do |data, _remaining, _content_length|
    f.syswrite data
  end

  new_resource.checksum = Chef::Digester.checksum_for_file(f.path)
  if !current_resource.exists || (current_resource.checksum != new_resource.checksum)
    converge_by("Moving new file with checksum to #{new_resource.file}") do
      move_file(f.path, new_resource.file)
    end
    new_resource.updated_by_last_action(true)
  else
    f.unlink
  end
end

action :create_if_missing do
  unless current_resource.exists
    action_create
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  if current_resource.exists
    # Use md5 checksums because CloudFiles etag is md5
    new_resource.checksum = Chef::Digester.generate_md5_checksum_for_file(new_resource.file)
    directory = get_directory(new_resource.container)
    remote_file = directory.files.get(object(new_resource))
    unless remote_file.nil?
      converge_by("Destroying object #{object(new_resource)}") do
        remote_file.destroy
      end
      new_resource.updated_by_last_action(true)
    end
  end
end

action :upload do
  if current_resource.exists
    # Use md5 checksums because CloudFiles etag is md5
    new_resource.checksum = Chef::Digester.generate_md5_checksum_for_file(new_resource.file)
    directory = get_directory(new_resource.container)
    remote_file = directory.files.get(object(new_resource))
    if remote_file.nil? || remote_file.etag != new_resource.checksum
      converge_by("Uploading new file #{object(new_resource)} with
       checksum #{new_resource.checksum} to #{new_resource.container} container") do
        directory.files.create key: object(new_resource),
                               body: ::File.open(new_resource.file)
      end
      new_resource.updated_by_last_action(true)
    end
  end
end

private

def get_directory(n)
  directory = swift.directories.get(n)
  swift.directories.create key: n unless directory
  directory
end

def object(resource)
  if resource.object
    resource.object
  else
    ::File.basename(resource.file)
  end
end

# Defining custom method to work around EACCESS errors on Windows when attempting to move across devices.
# Attrib to tknerr for workaround found in Berkshelf issue #140
def move_file(src, dest)
  FileUtils.mv(src, dest, force: false)
rescue Errno::EACCES
  FileUtils.cp_r(src, dest)
  FileUtils.rm_rf(src)
end
