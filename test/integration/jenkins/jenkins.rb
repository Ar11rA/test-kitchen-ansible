describe command('which java') do
  its('stdout') { should match /bin\/java/ }
end
