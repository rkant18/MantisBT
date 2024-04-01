# MantisBT
complete configuration for external database Mysql to container 
########build image ########
$ docker build -t mantisbt:latest .    ####this command will run from directory where docker-compose and dockerfile present.

$ sudo docker-compose up -d     ####run container indeattached mode


NoteS::
1- MySQL configuration file (/etc/mysql/mysql.conf.d/mysqld.cnf). From the configuration, it appears that MySQL is configured to listen on all network interfaces (**bind-address = 0.0.0.0**), which should allow connections from remote hosts.

2- However, it's worth noting that there is a commented-out line for socket parameter:

# socket        = /var/run/mysqld/mysqld.sock


3- Check Firewall Rules: Make sure that there are no firewall rules blocking incoming connections to port 3306.

#########CREATE USER 'root'@'192.168.1.5' IDENTIFIED BY 'your_password';
#########GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.5' WITH GRANT OPTION;
#########FLUSH PRIVILEGES;


CREATE USER 'root'@'172.19.0.2' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.5' WITH GRANT OPTION;
FLUSH PRIVILEGES;
###################################################################################################
Access MantisBT:  http://localhost:8989 or http://<your_server_ip>:8989

Log in: Use the default administrator credentials to log in for the first time:

Username: administrator
Password: root
###################################################################################################
