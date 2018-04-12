base:
  '192.168.0.124':
    - roles.master
    - roles.datanode

   '192.168.0.125':
     - roles.backup
     - roles.datanode

   '192.168.0.126':
     - roles.datanode