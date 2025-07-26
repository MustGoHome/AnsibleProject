Role Name
=========

auto_log_config installs and sets up log server.

Requirements
------------

use mongodb, elasticsearch.

Role Variables
--------------

jdk_package: java-1.8.0-openjdk

mongodb_baseurl: https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
mongodb_package: mongodb-org

elastic_baseurl: https://artifacts.elastic.co/packages/oss-7.x/yum
elastic_rpm_key: https://artifacts.elastic.co/GPG-KEY-elasticsearch
elastic_package: elasticsearch-oss

rsyslog_listen: 1514
graylog_listen: 9000

Dependencies
------------

none

Example Playbook
----------------

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

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
