~~~bash
# configurar la base de datos (SOLO UNA VEZ)
sudo apt install mysql-server
sudo apt install mysql-client

sudo mysqld_safe --skip-grant-tables &
mysql -uroot


use mysql;

update user set authentication_string=PASSWORD("mynewpassword") where User='root';

flush privileges;

quit

# para arrancar o parar la base de datos:
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start

# login en la base de datos
mysql -u root -p

# cargar las tablas y los datos
mysql -u root -p < tablas.sql
mysql -u root -p < objetos.sql

# ejecutar la interfaz gráfica
python3 main.py localhost root <password> ddsi
~~~

