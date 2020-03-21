// referencia para ver logs
// aqui una guia completa: https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs
$ journalctl

// ver logs de un servicio en particular
$ journalctl -u nginx.service


// ver logs de ultimos 5 minutos
journalctl -u  nginx.service --since "5 minute ago"
