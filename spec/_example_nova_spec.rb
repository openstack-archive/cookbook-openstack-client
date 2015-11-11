# Encoding: utf-8

require_relative 'spec_helper'

describe 'openstack_client::_example_nova' do
  let(:runner) { ChefSpec::SoloRunner.new(UBUNTU_OPTS) }
  let(:node) { runner.node }
  let(:chef_run) { runner.converge(described_recipe) }

  it 'spins up a test machine' do
    expect(chef_run).to create_openstack_client_nova_server(
      'test1').with(action: [:create])
  end
end

describe 'openstack_client::_example_nova' do
  let(:runner) { ChefSpec::SoloRunner.new(UBUNTU_OPTS) }
  let(:node) { runner.node }
  let(:chef_run) { runner.converge(described_recipe) }

  it 'deletes a test machine' do
    expect(chef_run).to delete_openstack_client_nova_server(
      'test').with(action: [:delete])
  end
end

describe 'openstack_client::_example_nova' do
  let(:runner) { ChefSpec::SoloRunner.new(UBUNTU_OPTS) }
  let(:node) { runner.node }
  let(:chef_run) { runner.converge(described_recipe) }

  it 'install the nokogiri gem' do
    expect(chef_run).to upgrade_chef_gem('nokogiri')
  end

  it 'install the fog gem' do
    expect(chef_run).to upgrade_chef_gem('fog')
  end
end
