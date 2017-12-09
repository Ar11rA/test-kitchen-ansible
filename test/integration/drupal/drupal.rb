describe command('which php') do
  its('stdout') { should match /bin\/php/ }
end

describe command('php -v | head -n 1') do
  its('stdout') { should match /7.0.25/ }
end

describe command('which nginx') do
  its('stdout') { should match /sbin\/nginx/ }
end
