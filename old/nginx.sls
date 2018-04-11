{% set confdir="/etc/nginx/conf/" %}
{% if grains['num_cpu'] > 2 %}
install_nginx:
  pkg.installed:
    - name: nginx

nginx_running:
  service.running:
    - name: nginx
    - enable: Ture
    - require:
      - pkg: install_nginx
    - watch:
      - file: nginx_conf
      - file: vhost_conf

nginx_conf:
  file.managed:
    - name: {{ confdir }}nginx.conf
    - source: salt://nginx.j2
    - user: root
    - group: root
    - template: jinja
    - mode :644

vhost_conf:
  file.managed:
    - name: {{ confdir }}conf.d/nginx.conf
    - source: salt://test_vhost.conf
    - user: root
    - group: root
    - mode: 644
{% endif %}