Role Name
=========

auto_ftp_config installs and sets up ftps server.

Requirements
------------

use vsftpd only.

Role Variables
--------------

ftp_listen: 2121
ftp_banner_file: /etc/vsftpd/banner.txt 
ftp_user: fedora

passive_min_port: 30000
passive_max_port: 30100
data_listen: "{{ passive_min_port }}-{{ passive_max_port }}"

ssl_crt_path: /etc/pki/tls/certs/vsftpd.pem
ssl_key_path: /etc/pki/tls/private/vsftpd.key
ssl_merge_path: /etc/pki/tls/certs/vsftpd_merged.pem

Dependencies
------------

none

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

  hosts: ftp_server
  tasks:
    - name: Role - auto_ftp_config
      ansible.builtin.import_role:
        name: auto_ftp_config
      vars:
        ftp_listen: 2121
        ftp_banner_file: /etc/vsftpd/banner.txt 
        ftp_user: fedora
        passive_min_port: 30000
        passive_max_port: 30100
        data_listen: "{{ passive_min_port }}-{{ passive_max_port }}"
        ssl_cert_file: /etc/pki/tls/certs/vsftpd.pem

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
