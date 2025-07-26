Role Name
=========

auto_nfs_config installs and sets up nfs server.

Requirements
------------

use nfs-utils only.

Role Variables
--------------

shared_directory: /www
shared_subent: 192.168.20.0/24
shared_options: (rw,no_root_squash,nohide,subtree_check)

Dependencies
------------

none

Example Playbook
----------------

  hosts: ha_server
  tasks:
    - name: Role - auto_nfs_config
      ansible.builtin.include_role:
        name: auto_nfs_config
      vars:
        shared_directory: /www
        shared_subent: 192.168.20.0/24
        shared_options: (rw,no_root_squash,nohide,subtree_check)

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
