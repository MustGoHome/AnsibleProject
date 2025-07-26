# Ansible Project
### History
---
- 2025-07-13 : Add AnsibleAutoConfig
- 2025-07-19 : Add AnsibleAutoNTPConfig
- 2025-07-21 : Add AnsibleAutoDNSConfig
- 2025-07-22 : Add AnsibleAutoApacheConfig
- 2025-07-22 : Update AnsibleAutoDNSConfig - DNS -> DDNS(used TSIG)
- 2025-07-24 : Add AnsibleAutoNginxConfig, Update DNS(+8.8.8.8) and handler always run now(changed_when: true)
- 2025-07-25 : Add AnsibleAutoFTPConfig
- 2025-07_26 : Add AnsibleAutoLogConfig

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

5. **AnsibleAutoFTPConfig** : Automatically set up the FTPS server through the Answer Manager server.
    - _TEST CMD : lftp -u fedora node2 -p 2121_
    - _Set some variables and proceed._
    ```EXAMPLE
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
    ```

6. **AnsibleAutoLogConfig** : Automatically set up the Log server through the Answer Manager server.
    - _TEST CMD : firefox log.example.com:9000_
    - _Set some variables and proceed._
    ```EXAMPLE
    hosts: log_server
    tasks:
      - name: Role - auto_log_config
        ansible.builtin.import_role:
          name: auto_log_config
        vars:
          jdk_package: java-1.8.0-openjdk
          mongodb_baseurl: https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
          mongodb_package: mongodb-org
          elastic_baseurl: https://artifacts.elastic.co/packages/oss-7.x/yum
          elastic_rpm_key: https://artifacts.elastic.co/GPG-KEY-elasticsearch
          elastic_package: elasticsearch-oss
          rsyslog_listen: 1514
          graylog_listen: 9000
    ```
