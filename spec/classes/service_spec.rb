require 'spec_helper'

describe 'sendmail::service' do
  let(:title) { 'sendmail' }

  let(:facts) do
    { :operatingsystem => 'Debian' }
  end

  context 'On Debian with defaults' do
    it {
      should contain_service('sendmail').with(
        'ensure' => 'running',
        'name'   => 'sendmail',
        'enable' => 'true'
      )
    }
  end

  context 'On Debian with service_manage => false' do
    let(:params) do
      { :service_manage => false }
    end

    it { should_not contain_service('sendmail') }
  end

  context 'On Debian with service_ensure => stopped' do
    let(:params) do
      { :service_ensure => 'stopped' }
    end

    it { should contain_service('sendmail').with_ensure('stopped') }
  end

  context 'On Debian with service_ensure => running' do
    let(:params) do
      { :service_ensure => 'running' }
    end

    it { should contain_service('sendmail').with_ensure('running') }
  end

  context 'On Debian with service_ensure => true' do
    let(:params) do
      { :service_ensure => true }
    end

    it { should contain_service('sendmail').with_ensure('running') }
  end

  context 'On Debian with service_ensure => false' do
    let(:params) do
      { :service_ensure => false }
    end

    it { should contain_service('sendmail').with_ensure('stopped') }
  end

  context 'On Debian with service_enable => true' do
    let(:params) do
      { :service_enable => true }
    end

    it { should contain_service('sendmail').with_enable('true') }
  end

  context 'On Debian with service_enable => false' do
    let(:params) do
      { :service_enable => false }
    end

    it { should contain_service('sendmail').with_enable('false') }
  end

  context 'On Debian with service_name set' do
    let(:params) do
      { :service_name => 'sendmoremail' }
    end

    it { should contain_service('sendmail').with_name('sendmoremail') }
  end
end
