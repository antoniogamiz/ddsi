.~~~bash
# configurar la base de datos (SOLO UNA VEZ)
sudo apt install mysql-server
sudo apt install mysql-client

sudo mysqld_safe --skip-grant-tables &
mysql -uroot


use mysql;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'test'; 

flush privileges;

quit

sudo service mysql restart

# para arrancar o parar la base de datos:
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start

# login en la base de datos
mysql -u root -p

# cargar las tablas y los datos
mysql -u root -p < tablas.sql
mysql -u root -p < objetos.sql

# ejecutar la interfaz gráfica
python3 main.py root test
~~~

