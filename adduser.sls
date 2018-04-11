{% for i in pillar['user'] %}
add_{{i}}:
  user.present:
    - name: {{ i }}
{% endif %}