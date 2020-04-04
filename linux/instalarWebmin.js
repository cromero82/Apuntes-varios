
apt install wget software-properties-common apt-transport-https

wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -

add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"

apt update

apt install webmin

/*****   PUREDE NO FUNCONAR - SE RECOMIENDA Hacerlo manualmente por cloud seleccionado o usando otro comando     *****/
ufw allow 10000/tcp

// Resetear pass super usuario
/usr/share/webmin/changepass.pl /etc/webmin root espingsoftware*
