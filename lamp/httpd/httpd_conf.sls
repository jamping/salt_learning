httpd_conf:
    file.managed:
      - name: /etc/httpd/conf/httpd.conf
      - source: salt://httpd/file/httpd.conf
      - user: root
      - group: root
      - mode: 600