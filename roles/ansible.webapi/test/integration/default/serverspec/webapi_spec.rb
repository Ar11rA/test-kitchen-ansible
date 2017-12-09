require 'spec_helper'

describe 'Splunk' do
  describe file('/apps/splunkforwarder') do
    it { should exist }
    it { should be_directory }
  end
end