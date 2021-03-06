#
# Cookbook Name:: chef
# Recipe:: default
#
# Copyright 2008, Engine Yard, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Grab all the client config variables from the node, to make things easier to extend
config_variables = Hash.new
node.each do |key|
  if key.to_s =~ /chef_server/
    config_variables[k] = node[k]
  end
end

template "node['chef_server_config']" do
  owner "root"
  mode  0644
  source "server.rb.erb"
  variables config_variables
end
