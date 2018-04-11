httpd_running:
    service.running:
      - name: httpd
      - enable: True
      - require:
        - pkg: install_httpd
      - watch:
          - file: httpd_conf
          - file: php_conf