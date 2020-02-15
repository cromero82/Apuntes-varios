a) Ingrese con su usuario root al servidor
b) Para crear el usuario con los privilegios ingrese el siguiente comando:
useradd -u 0 -o -g 0 “nombre_de_usuario”

Ejemplo:
useradd -u 0 -o -g 0 sysadmin

c) Para añadir una contraseña al usuario ingrese el siguiente comando:
	
passwd “nombre_de_usuario”

Ejemplo:
1
passwd sysadmin
