# Encoding: utf-8

require_relative 'spec_helper'

describe 'openstack_client::default' do
  describe 'ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'writes some chefspec code' do
      skip 'todo'
    end
  end
end
