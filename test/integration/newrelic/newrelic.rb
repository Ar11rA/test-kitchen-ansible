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


