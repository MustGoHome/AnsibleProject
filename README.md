# Ansible Project
### History
- 2025-07-13 : Add AnsibleAutoConfig
- 2025-07-19 : Add AnsibleAutoNTPConfig
### Scripts
1. **AnsibleAutoConfig** : Initialize the Ansible manager node and managed nodes. and install an Ansible package from epel-release.
    - _Update the 'hosts' and run 'run_config.sh'._
2. **AnsibleAutoNTPConfig** : Automatically set up the NTP server and client through the Answer Manager server.
    - _Set some variables and proceed._
    ```EXAMPLE
    hosts: ntp_server
    tasks:
        - name: Role - auto_ntp_config
          ansible.builtin.include_role:
            name: auto_ntp_config
        vars:
          ntp_server_provider: chrony
          ntp_server_provider_service: chronyd
          ntp_server_allow_subnet: 192.168.20.0/24
    ```
