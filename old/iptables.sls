iptables:
  pkg.installed:
    - name: iptables

  service.running:
    - name: iptables
    - enable: True
    - watch:
      - pkg: iptables
      - file: iptables

  file.managed:
    - source: salt://iptables/iptables
    {% if graind['os'] == 'CentOS' or grains['os'] == 'Fedora' %}
    - name: /etc/sysconfig/iptables
    {% elif grains['os'] == 'Arch' %}
    - name: /etc/conf.d/iptables
    {% endif %}