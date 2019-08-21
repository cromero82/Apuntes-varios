  @Override
  public Menu convertEntityToResource(EntidadMenu entidad) {
	  Menu result = Menu.builder()
			  .id(entidad.getId())
			  .titulo(entidad.getTitulo())
			  .routerLink(entidad.getRutaInterna())
			  .href(entidad.getRutaExterna())
			  .icon(entidad.getIcono())
			  .descripcion(entidad.getDescripcion())
			  .orden(entidad.getOrden())
			  .target(entidad.getTarget()).build();
	  if (entidad.getMenuSuperior() == null) {
		  result.setParentId(0L);
	  }
	  else {
		  result.setParentId(entidad.getMenuSuperior().getId());
	  }
	  if (entidad.getPermiso() == null) {
		  result.setPermisoId(0L);
	  }
	  else {
		  result.setPermisoId(entidad.getPermiso().getId());
	  }
	  result.setHasSubMenu(entidad.getHasSubMenu());
	  if (entidad.getActivo() == null) {
	  result.setActivo(true);
	  }
	  else
	  {
		  result.setActivo(entidad.getActivo());
	  }
    return result;
  }
