keepalived_conf:
  file.mageaged:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://keepalived/templates/keepalived.conf
    - user: root
    - group: root
    - template: jinja
    - mode: 644
    - require:
      - pkg: install_keepalived
      - cmd: scriptes_dir

  scripts_dir:
    cmd.run:
      - name: mkdir -pv /etc/keepalived/scripts/
      - unless: test -d /etc/keepalived/scripts/

    {% for s in ["redis_backup.sh","redis_check.sh","redis_fault.sh","redis_master.sh","redis_stop.sh"] %}
    keepalived_{{s}}:
      file.managed:
        - name: /etc/keepalived/scripts/{{s}}
        - source: salt://keepalived/templates/scripts/{{s}}
        - user: root
        - group: root
        - template: jinja
        - mode: 755
        - require:
          - pkg: install_keepalived
    {% endif %}