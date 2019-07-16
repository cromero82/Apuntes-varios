
// Se clona el objeto en formato string (serializado)
this.cloneListaItem = JSON.stringify(this.listaItems); 

// Aqui cambios.

// para restaurar datos, se copia la información serializada
this.listaItems = JSON.parse(this.cloneListaItem);
