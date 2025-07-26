Role Name
=========

auto_ha_config installs and sets up lb server.

Requirements
------------

use haproxy only.

Role Variables
--------------

ha_listen: 80
haproxy_node:
  node1: 192.168.20.20:80
  node2: 192.168.20.20:80


Dependencies
------------

none

Example Playbook
----------------

  hosts: ha_server
  tasks:
    - name: Role - auto_ha_config
      ansible.builtin.include_role:
        name: auto_ha_config
      vars:
        ha_listen: 80
        haproxy_node:
          node1: 192.168.20.20:80
          node2: 192.168.20.30:80

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
