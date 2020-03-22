// superadministrador
$ sudo su

// crear un directorio
$ mkdir nombre_dir

// borrar un directorio
$ rmdir nombre_dir

// borrar un directorio con subdirectorios (no vacio)
$ rm -r nombre_dir

// renombrar archivo
$ mv nombreArchivoActual nombreArchivoNuevo

// Permisos de lectura y escritura de directorios
$ chmod 777 ruta_directorio

// =======================          NANO TEXT EDITOR          ======================================
// abrir un archivo
$ nano /etc/xxxxx/ruta_directorio/nombre_archivo.ext

// crear y abrir un archivo
$ nano /etc/xxxxx/ruta_directorio/nombre_archivo.ext

// en cualquier caso guardar cambios
// luego de editar un archivo presionamos: Ctrl + X
// presionamos: Enter (confirmando el nombre de archivo) o la opcion Y: (Yes save changes)

// copiar un archivo
// $ cp ruta_con_archivo ruta_con_archivo_nombre2
// ejemplo
$ cp /etc/nginx/nginx.conf /etc/nginx/nginx-backup.conf
