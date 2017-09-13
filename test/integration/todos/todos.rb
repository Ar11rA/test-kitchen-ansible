describe file('/srv/todos_ui') do
  it { should exist }
  it { should be_directory }
end

describe file('/srv/todos_ui/package.json') do
  it { should exist }
  it { should be_file }
end

describe port(3000) do
  it { should be_listening }
  its('processes') {should include 'node'}
end

describe command('git --version') do
  its('stdout') { should match /git version 1.8.3.1/ }
end

describe command('node -v') do
  its('stdout') { should match /v6.11.3/ }
end

describe command('gulp -v | grep CLI') do
  its('stdout') { should match /3.9.1/ }
end

describe command('webpack -v') do
  its('stdout') { should match /3.5.6/ }
end

describe file('/srv/todos_ui/node_modules') do
  it { should exist }
  it { should be_directory }
end