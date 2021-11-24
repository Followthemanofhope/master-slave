include:
  - lamp.database.mysql.install

slave-mysql-cnf:
  file.managed:
    - source: salt://mysqlzc/files/slave.cnf
    - name: /etc/my.cnf
    - user: root
    - group: root
    - mode: '0644'


slave-mysqld.service:
  service.running:
    - name: mysqld.service 
    - enable: true
    - reload: true
    - watch:
      - file: /etc/my.cnf

salt://mysqlzc/files/start_slave.sh:
  cmd.script
