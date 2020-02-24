1. Configuración básica del servidor ftp en linux 
https://www.techrepublic.com/article/how-to-quickly-setup-an-ftp-server-on-ubuntu-18-04/

2. permitir puertos pasv_min_port=10000 y pasv_max_port=10100 en firewall

$ sudo ufw allow 20/tcp
$ sudo ufw allow 21/tcp
$ sudo ufw status
# service vsftpd restart


4. Usar putty gen para generar llave rsa (privada) para poder acceder con filezilla
a) agregar en gpc/ compute engine / metadatos la llave rsa privada
b) agregarla a filezilla
https://www.onepagezen.com/google-cloud-ftp-filezilla-quick-start/
