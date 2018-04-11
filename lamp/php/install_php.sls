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