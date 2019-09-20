// ----- Para habilitar el acceso de equipos remotos a nuestra maquina a traves de wifi, ya que win-10 la restringe por default
// en consola ejecutada como administrador ejecutar lo siguiente:
netsh advFirewall Firewall add rule name="Regla Solvetic PING IPv4" protocol=icmpv4:8,any dir=in action=allow
