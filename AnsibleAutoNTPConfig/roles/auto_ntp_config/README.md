Role Name
=========

auto_ntp_config installs and sets up ntp server.

Requirements
------------

use chrony only.

Role Variables
--------------

ntp_server_provider: chrony
ntp_server_provider_service: chronyd
ntp_server_allow_subnet: 192.168.20.0/24

Dependencies
------------

none

Example Playbook
----------------

  hosts: ntp_server
  tasks:
    - name: Role - auto_ntp_config
      ansible.builtin.include_role:
        name: auto_ntp_config
      vars:
        ntp_server_provider: chrony
        ntp_server_provider_service: chronyd
        ntp_server_allow_subnet: 192.168.20.0/24

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
