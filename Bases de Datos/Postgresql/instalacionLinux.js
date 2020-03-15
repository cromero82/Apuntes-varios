// ---------------------------------------
// Instalación y configuracion pg-admin en linux
// ---------------------------------------

// 1. instalacion
$ sudo apt-get install postgresql

// Generó la siguiente informacion importante
// ->
	Creating new cluster 9.6/main ...
  config /etc/postgresql/9.6/main
  data   /var/lib/postgresql/9.6/main
  locale en_US.UTF-8
  socket /var/run/postgresql
  port   5432

// Restaurar contraseña de administrador  
$ cd /etc/postgresql/9.6/main
$ nano pg_hba.conf
// habilitar la linea (al finalizar el archivo) 
// host    replication     all             127.0.0.1/32            md5
// host    replication     all             127.0.0.1/32            md5
// Ctrl + o (save) ctrl + x pasar salir del editor de texto.

// Permitir acceder postgres remotamente
$ nano postgresql.conf
// habilitar y configurar la línea (linea 59 aprox. en la seccion # CONNECTIONS AND AUTHENTICATION )

listen_addresses = '*'	
// Ctrl + o (save) ctrl + x pasar salir del editor de texto.

$ exit
$ sudo service postgresql restart

// corroborar que los servicios esten ejecutandose
$ sudo service --status-all

// reset password
$ sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'espingsoftware*';"

// x. ACCEDER a postgresql con uusario postgres
$ psql -U postgres -h localhost
