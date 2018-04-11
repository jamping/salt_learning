php_conf:
    file.managed:
      - name: /etc/php.ini
      - source: salt://php/file/php.ini
      - user: root
      - group: root
      - mode: 600