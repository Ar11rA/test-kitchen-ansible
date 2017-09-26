describe package('git') do
  it { should be_installed }
end

describe command('which java') do
  its('stdout') { should match /bin\/java/ }
end

describe command('node -v') do
  its('stdout') { should match /v6.11.3/ }
end

describe command('npm -v') do
  its('stdout') { should match /3.10.10/ }
end

describe npm('gulp') do
  it { should be_installed }
  its('version') { should eq '3.9.1' }
end

describe npm('cordova') do
  it { should be_installed }
  its('version') { should eq '6.5.0' }
end

describe file('/apps') do
  it { should exist }
  it { should be_directory }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0755' }
end

describe file('/home/vagrant/jenkins') do
  it { should exist }
  it { should be_directory }
  its('owner') { should eq 'vagrant' }
  its('group') { should eq 'vagrant' }
  its('mode') { should cmp '0755' }
end

describe file('/apps/android-sdk-linux/build-tools/26.0.0') do
  it { should exist }
  it { should be_directory }
end
