# Ansible Project
### History
---
- 2025-07-13 : Add AnsibleAutoConfig
- 2025-07-19 : Add AnsibleAutoNTPConfig
- 2025-07-21 : Add AnsibleAutoDNSConfig
- 2025-07-22 : Add AnsibleAutoApacheConfig
- 2025-07-22 : Update AnsibleAutoDNSConfig - DNS -> DDNS(used TSIG)
- 2025-07_24 : Add AnsibleAutoNginxConfig, Update DNS(+8.8.8.8) and handler always run now(changed_when: true).

### Scripts
---
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
    
2. **AnsibleAutoNTPConfig** : Automatically set up the DNS server and client through the Answer Manager server.
    - _Set some variables and proceed._
    ```EXAMPLE
    hosts: dns_server
    tasks:
      - name: Role - auto_dns_config
        ansible.builtin.include_role:
          name: auto_dns_config
        vars:
          dns_server_domain: example.com
          dns_server_forwarders: 8.8.8.8
    ```

3. **AnsibleAutoApacheConfig** : Automatically set up the Apache&Tomcat server with ssl.
    - _Set some variables and proceed._
    ```EXAMPLE
    hosts: web_server
    tasks:
      - name: Role - auto_apache_config
        ansible.builtin.include_role:
          name: auto_apache_config
        vars:
          jdk_package: java-1.8.0-openjdk.x86_64
          tomcat_user: tomcat
          tomcat_source: https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.tar.gz
          tomcat_listen: 8080
          tomcat_file: /usr/local/apache-tomcat-9.0.105
          tomcat_secret: soldesk1.
          apache_listen: 80
          apache_name: "web.example.com:{{ apache_listen }}"
          apache_proxy_pass: http://localhost:8080/
          apache_listen_ssl: 443
          ssl_crt_path: /etc/pki/tls/certs/httpd.crt
          ssl_key_path: /etc/pki/tls/private/httpd.key
          ssl_country: "KR"
          ssl_state: "AP Northeast"
          ssl_city: "Seoul"
          ssl_org: "Example Company"
          ssl_ou: "Example Unit"
          ssl_cn: "web.example.com"
          ssl_email: "ansible@example.com"
    ```

4. **AnsibleAutoNginxConfig** : Automatically set up the Nginx&Tomcat server with ssl.
    - _Set some variables and proceed._
    ```EXAMPLE
    hosts: nginx_server
    tasks:
      - name: Role - auto_nginx_config
        ansible.builtin.include_role:
          name: auto_nginx_config
        vars:
          jdk_package: java-1.8.0-openjdk.x86_64
          tomcat_user: tomcat
          tomcat_source: https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.tar.gz
          tomcat_listen: 8080
          tomcat_file: /usr/local/apache-tomcat-9.0.105
          nginx_listen: 80
          nginx_name: "nginx.example.com:{{ nginx_listen }}"
          nginx_proxy_pass: http://localhost:8080
          nginx_listen_ssl: 443
          ssl_crt_path: /etc/pki/tls/certs/httpd.crt
          ssl_key_path: /etc/pki/tls/private/httpd.key
          ssl_country: "KR"
          ssl_state: "AP Northeast"
          ssl_city: "Seoul"
          ssl_org: "Example Company"
          ssl_ou: "Example Unit"
          ssl_cn: "www3.example.com"
          ssl_email: "root@localhost"
    ```
