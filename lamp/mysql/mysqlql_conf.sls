mysql_conf:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://mysql/file/my.cnf
    - user: root
    - group: root
    - mode: 600