ansible-webapi
=========

Role to setup web-api infrastructure regarding splunk, symlinks, NAT/non NAT configs and nginx.

Requirements
------------

* Redhat cent OS >= 6
* Ruby >= 2.3.0 
* ansible >= 2.2

Role Variables
--------------

* `{splunk_tarball}` - Location of tar file that contains splunk binaries and configs.
* `{splunk_port}` - The port on which splunk is supposed to run the forwarder.
* `{nat_url}` - The NAT url from which the json files are downloaded from.
* `{non_nat_url}` - The non NAT url from which the json files are downloaded from.
* `{nat_web_api}` - Set to true if the set of NAT urls are to be used.

Dependencies
------------

For web-api playbook, the following roles are also used:

* Code for web-api should be provisioned from jenkins in /opt/web-api
* Basic dev tools like gcc, make, git and autoconf.
* geerlingguy.nodejs or offline node installation
* franklinkim.newrelic

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    ---
      - hosts: webapi
        vars:
          - splunk_tarball: /home/vagrant/splunkforwarder-5.0.2-149561-Linux-x86_64.tgz
          - splunk_port: 8090
          - nat_url: 10.2.2.2
          - nat_web_api: true
        roles:
          - ansible-webapi

License
-------

BSD

Author Information
------------------

* Ar11rA
* gulativibhav