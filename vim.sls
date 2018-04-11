vim:
  pkg.installed:
    {% if grains['os_family'] == 'RedHat' %}
    - name: vim-enhanced
    {% elif grains['os_family'] == 'Debain' %}
    - name: vim-nox
    {% endif %}

{% if grains['os_family'] == 'Arch' %}
/etc/vimrc:
  file.managed:
    - source: salt://vim/vimrc
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: vim
{% endif %}