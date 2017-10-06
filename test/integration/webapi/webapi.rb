describe package('git') do
  it { should be_installed }
end

describe package('gcc') do
  it { should be_installed }
end

describe package('make') do
  it { should be_installed }
end

describe package('glibc') do
  it { should be_installed }
end

describe package('automake') do
  it { should be_installed }
end

describe package('autoconf') do
  it { should be_installed }
end

describe command('which docker') do
  its('stdout') { should match /bin\/docker/ }
end

describe command('docker -v') do
  its('stdout') { should match /Docker version 17.09/ }
end

describe command('node -v') do
  its('stdout') { should match /v6.11.4/ }
end

describe command('npm -v') do
  its('stdout') { should match /3.10.10/ }
end


describe command('pm2 -v') do
  its('stdout') { should match /2.7.1/ }
end

describe npm('gulp') do
  it { should be_installed }
  its('version') { should eq '3.9.1' }
end

describe npm('cordova') do
  it { should be_installed }
  its('version') { should eq '6.5.0' }
end

describe file('/usr/sbin/nrsysmond') do
  it { should exist }
  it { should be_file }
end

describe file('/etc/newrelic/nrsysmond.cfg') do
  it { should exist }
  it { should be_file }
end

describe file('/var/run/newrelic/nrsysmond.pid') do
  it { should exist }
  it { should be_file }
end

describe file('/apps/splunkforwarder') do
  it { should exist }
  it { should be_directory }
end


describe port(8089) do
  it { should be_listening }
  its('processes') {should include 'splunkd'}
end