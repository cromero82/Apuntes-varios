int cant = (int) entidad.getMantenimiento().getDocumentos().stream().filter(dm -> dm.getId() ==null).count();
