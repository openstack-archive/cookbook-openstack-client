# encoding: UTF-8
if defined?(ChefSpec)
  def create_openstack_client_nova_server(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :openstack_client_nova_server,
      :create,
      resource_name)
  end

  def delete_openstack_client_nova_server(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :openstack_client_nova_server,
      :delete,
      resource_name)
  end
end
