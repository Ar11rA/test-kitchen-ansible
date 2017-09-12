describe file('/opt/redis/bin') do
  it { should exist }
  it { should be_directory }
end

describe port(6379) do
  it { should be_listening }
  its('processes') {should include 'redis-server'}
end

describe port(6380) do
  it { should be_listening }
  its('processes') {should include 'redis-server'}
end

describe port(26384) do
  it { should be_listening }
  its('processes') {should include 'redis-server'}
end

describe port(26385) do
  it { should be_listening }
  its('processes') {should include 'redis-server'}
end

describe port(26386) do
  it { should be_listening }
  its('processes') {should include 'redis-server'}
end

