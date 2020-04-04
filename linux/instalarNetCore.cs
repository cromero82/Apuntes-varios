En primer lugar, es necesario instalar el paquete «apt-transport-https», el cual nos permite conectar con los repositorios de Microsoft:

sudo apt-get install apt-transport-https
Después, vamos a registrar las claves de Microsoft dentro de el registro de claves seguras, de cara a que no nos de advertencias al utilizar HTTPS los repositorios, para ello, escribimos las siguientes instrucciones en la terminal (En caso de no utilizar Debian sino otra distro, puedes consultar las instrucciones aquí):

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

// Instalar .NET CORE 3.1 Runtime 
$ sudo apt-get update

$ sudo apt-get install aspnetcore-runtime-3.1

// Instalar .NET CORE SDK (En caso de ser requerido)
apt-get install dotnet-sdk-3.1

// Comprobar
$ dotnet --version
