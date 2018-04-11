base:
  "minion-one":
    - nginx
  "minion-two":
    - match: list
    - httpd
    - php
    - mysql