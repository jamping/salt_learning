nginx_conf:
  file.managed:
    - name: /etc/nginx/conf/nginx.conf
    - source: salt://nginx/template/nginx.j2
    - user: root
    - group: root
    - template: jinja
    - mode: 644