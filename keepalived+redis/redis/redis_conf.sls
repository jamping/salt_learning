redis_conf:
  file.managed:
    - name: /etc/redis.conf
    - source: salt://redis/templates/redis.j2
    - user: root
    - group: root
    - templates:jinja
    - mode:644
    - require:
      - pkg: install_redis

  redis_dir:
    cmd.run:
      - name: mkdir -pv /data/redis && chown redis.redis /data/redis
      - unless: test -d /data/redis