void functionHere(X entidad){
  entidad.getMantenimiento().getDocumentos().stream().map(da -> {
				 if(da.getId() == null) {
					 da.getDocumento().setAutor(autor);
					 da.getDocumento().setFecha(new Date());	
					 da.getDocumento().setNombre(da.getDocumento().getArchivo().getNombre());
				 }
				 return da;
			 }).collect(Collectors.toList());
       
 }
