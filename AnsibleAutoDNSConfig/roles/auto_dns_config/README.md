Role Name
=========

auto_dns_config installs and sets up dns server.

Requirements
------------

use bind only.

Role Variables
--------------

dns_server_domain: example.com
dns_server_forwarders: 8.8.8.8

Dependencies
------------

none

Example Playbook
----------------

  hosts: dns_server
  tasks:
    - name: Role - auto_dns_config
      ansible.builtin.include_role:
        name: auto_dns_config
      vars:
        dns_server_domain: example.com
        dns_server_forwarders: 8.8.8.8

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
