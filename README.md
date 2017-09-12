# Ansible Role and Playbooks Test Driven Infrastructure with test kitchen

This provides a bootstrap for the test kitchen framework in corporation with vagrant and ansible. These are some of the following:

  - Testing all the individal roles created
  - Checking if the infrastructure functions properly with custom playbooks
  - Testing with multiple platforms
  - Testing with multiple suites

# Requirements

  - Ruby 2.3.0
  - Ansible 2.3.2

# Installation

1. For installing the required gems:

  - Install bundler using `gem install bundler`
  - Run `bundle install`

2. For installing the required roles:

  `ansible-galaxy install -r requirements.yml --roles-path=./roles`