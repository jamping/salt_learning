install_apache:
  pkg.installed:
  {% if grains['os_family'] == 'Debain' %}
    - name: apache2
  {% elif grains['os_family'] == 'RedHat' %}
    - name: httpd
  {% endif %}
