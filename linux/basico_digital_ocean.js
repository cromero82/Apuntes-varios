// despues de instalar ssh y agregar clave ssh se debe habilitar el uso de password en ssh
Hola, tengo un equipo con Linux CentOS 6 como sistema operativo, al intentar conectarme a él con SSH, usando PuTTY, me aparece este error:
—————————
PuTTY Fatal Error
—————————
Disconnected: No supported authentication methods available (server sent: publickey,gssapi-keyex,gssapi-with-mic)
<referencia>
-- https://proyectoa.com/foros/tema/error-acceso-ssh-no-supported-authentication-methods-available/
-- Muchas gracias, he editado el fichero que dices con nano (tuve que instalarlo con un yum install nano), con

nano /etc/ssh/sshd_config

Y he añadido la línea:

PasswordAuthentication yes

Que no estaba, he guardado, he reiniciado el servicio SSH con:

service sshd restart

Ya me funciona perfectamente. Solucionado.
</referencia>
