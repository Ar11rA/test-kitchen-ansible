# Ansible Role and Playbooks Test Driven Infrastructure with test kitchen

### Overview

This provides a bootstrap for the test kitchen framework in corporation with vagrant and ansible. These are some of the following:

  - Testing all the individal roles created
  - Checking if the infrastructure functions properly with custom playbooks
  - Testing with multiple platforms
  - Testing with multiple suites

### Folder Structure

  - .kitchen - files created by kitchen gem to manage its resources
  - files - files required for installation or storage
  - playbooks - ansible playbooks required for provisioning infrastructure
  - roles - files required by playbooks
  - templates - j2 conf files needed for running systemd services( as per required in ansible roles )
  - test - inspec files structured according to the suite they are supposed to run
  - requirements.yml - any role that you want to install should be mentioned here

### Requirements

  - Ruby 2.3.0
  - Ansible 2.3.2

### Installation

1. For installing the required gems:

    - Install bundler using `gem install bundler`
    - Run `bundle install`

2. For installing the required roles:

    ```ansible-galaxy install -r requirements.yml --roles-path=./roles```

### Running Tests

The `.kitchen.yml` file is the entry point for all Kitchen CLI commands, here are the commands that you need:

1. `kitchen list` - Lists all the images(docker) or plaforms(Vagrant VMs) that are specified in the .kitchen.yml file.
2. `kitchen create <platform>` or `kitchen create` - Creates a temporary VM that can be viewed in VirtualBox or a temporary docker image, on which the infrastructure tests will be carried out. 
3. `kitchen converge <platform>` or `kitchen converge` - Converge is used to run the playbook or cookbook against which you are testing the infrastructure, it basically runs the playbook/cookbook on that machine.  
4. `kitchen verify <platform>` or `kitchen verify` - Verify tests your converged infrastructure against a test suite. Test suite contains the inspec tests that check if infrastructure is correctly built for a platform
5. `kitchen test <platform>` or `kitchen test` - This step destroys, creates, converges and verifies a VM.
6. `kitchen login <platform>` - To go inside a platform( or ssh to a box in real scenario), you can simply login using this.
7. `kitchen destroy <platform>` or `kitchen destroy` - Removes the VM or image from history

__NOTE__ - If you specify platforms in these commands, they run only for the mentioned platform. Otherwise, they run for all platforms in the .kitchen.yml. 

### Development

- Clone the repo
- Work in your own branch and raise a PR 
- Follow the folder structure please