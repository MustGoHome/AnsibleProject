Role Name
=========

auto_apache_config installs and sets up apache&tomcat server with ssl.

Requirements
------------

use httpd package from AppStream.
use tomcat source from apache site.

Role Variables
--------------

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

Dependencies
------------

none

Example Playbook
----------------

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

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
