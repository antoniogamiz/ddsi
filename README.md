# DDSI

# Instalar paquetes

Instalamos los paquetes mysql-server y mysql-client

# Cambiar la contraseña de root

https://support.rackspace.com/how-to/mysql-resetting-a-lost-mysql-root-password/

# Creación de la BBDD

Una vez instalado mysql creamos las tablas y añadimos algunos objetos:

mysql -u root -p < tablas.sql
mysql -u root -p < objetos.sql

# Programa

Lanzamos el programa mediante:

python3 Main.py localhost root CONTRASEÑA ddsi
