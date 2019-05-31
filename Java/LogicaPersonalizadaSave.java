@Override
	public EntidadSolicitud create(EntidadSolicitud entidad) {
		// TODO Auto-generated method stub
		entidad.setFecha(new Date());
		EntidadPk infoPK = servicioPk.detail(entidad.getPk(), 3);
		entidad = adicionarinfoPKSolicitud(entidad, infoPK );
		if(entidad.getEsProgramada() != null && entidad.getEsProgramada() == 0) {
			// para visita programada
			EntidadUsuario usuarioLogueado = servicioProfile.getProfile();
			Optional<EntidadPersona> persona = servicioPersona.getByIdentificacion(usuarioLogueado.getIdentificacion());
			EntidadVisita visita = new EntidadVisita();
			
			visita.setFecha(new Date());
			if (persona.isPresent())
			{
				visita.setResponsable(persona.get());
			}
			else
			{
				visita.setResponsable(null);
			}
			entidad.setVisita(visita);
			EntidadSolicitud resultEntity =  super.create(entidad);
			// Se registra la transicion "Envio a programacion"
			EntidadProcesoTransicionObjeto pto = new EntidadProcesoTransicionObjeto(); 			
			pto.setFecha(new Date());
			pto.setProcesoTransicion( repositorioProcesoTransicion.findOneById(41L).get() );
			pto.setUsuario(usuarioLogueado );
			pto.setAsignado(usuarioLogueado);
			pto.setObjeto(resultEntity.getId());			
			repositorioProcesoTransicionObjeto.save(pto);
			return resultEntity;
		}else {
			return  super.create(entidad);	
		}
	}
