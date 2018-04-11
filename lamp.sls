install_httpd:
    pkg.installed:
      - name: httpd

httpd_running:
    service.running:
      - name: httpd
      - enable: True
      - require:
        - pkg: install_httpd
      - watch:
          - file: httpd_conf
          - file: php_conf

httpd_conf:
    file.managed:
      - name: /etc/httpd/conf/httpd.conf
      - source: salt://httpd.conf
      - user: root
      - group: root
      - mode: 600

install_php:
    pkg.installed:
      - name: php_all
      - pkgs:
        - php
        - php-mysql
        - php-common
        - php-gd
        - php-mbstring
        - php-mcrypt
        - php-devel
        - php-xml
      - require:
        - pkg: install_httpd

php_conf:
    file.managed:
      - name: /etc/php.ini
      - source: salt://php.ini
      - user: root
      - group: root
      - mode: 600

install_mysql:
    pkg.installed:
      - name: mysql
      - pkgs:
        - mysql
        - mysql-server
        - mysql-devel

mysql_running:
    service.running:
      - name: mysqld