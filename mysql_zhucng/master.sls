include:
  - lamp.database.mysql.install


master-grant:
  cmd.run:
    - name: /usr/local/mysql/bin/mysql -uroot -p123 -e "grant replication slave,super on *.* to 'yang'@'192.168.75.150' identified by '123';flush privileges;"

master-mysql-cnf:
  file.managed:
    - source: salt://mysqlzc/files/master.cnf
    - name: /etc/my.cnf
    - user: root
    - group: root
    - mode: '0644'
    
mysqld.service:
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: /etc/my.cnf 
    
