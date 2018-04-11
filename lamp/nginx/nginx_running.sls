nginx_running:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: install_nginx
    - watch:
      - file: nginx_conf
      - file: vhost_conf