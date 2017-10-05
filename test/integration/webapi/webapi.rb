describe package('git') do
  it { should be_installed }
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

