# # encoding: utf-8

# Inspec test for recipe git_cookbook::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# describe package('git') do
#   it { should be_installed }
# end

describe command('node -v') do
   its('stdout') { should match /v6.11.3/ }
end

describe command('npm -v') do
   its('stdout') { should match /3.10.10/ }
end

# describe file('dir_usr') do
#   it { should exist }
#   it { should be_directory }
# end