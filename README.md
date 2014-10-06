Openstack Cookbook
==================

This is a library cookbook to consume openstack cloud resources.

Requirements
------------

- TBD

Attributes
----------

Attributes are self documented in `attributes/*.rb`

Usage
-----
#### openstack::default

Installs [fog](http://fog.io) gem and enabled LWRPs

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openstack]"
  ]
}
```

#### openstack::_example_swift

Example usage of swift LWRPs

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openstack]",
    "recipe[openstack::_example_swift]",
  ]
}
```

If you need a simple swift endpoint to test against, the following blog post will help you set up a [single node swift on rackspace cloud](http://blog.phymata.com/2013/02/18/swift-only-with-openstack-devstack-on-the-rackspace-cloud/).

Contributing
------------

Please use the typical Contrubution rules we have set up [here](https://wiki.openstack.org/wiki/Chef/GettingStarted#Contributing_to_the_OpenStack_Chef_Cookbooks),
if you have any questions about this book please go to `irc.freenode.net:#openstack-chef` or contact the [mailing-list](http://groups.google.com/group/opscode-chef-openstack).

License and Authors
-------------------

Apache 2

Paul Czarkowski,  username.taken@gmail.com
