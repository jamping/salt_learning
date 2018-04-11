redis_running:
  service.running:
    - name: redis
    - enable: True
    - require:
      - pkg: install_redis
    - watch:
      - file: redis_conf