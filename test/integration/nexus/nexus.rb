describe service('nexus') do
  it { should be_enabled }
end

describe command('which java') do
  its('stdout') { should match /bin\/java/ }
end