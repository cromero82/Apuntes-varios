@Override
	public EntidadSolicitud create(EntidadSolicitud entidad) {
		entidad.setFecha(new Date());
		if(entidad.getEsProgramada() == 0) {
			// para visita programada
			EntidadUsuario usuarioLogueado = servicioProfile.getProfile();
			Optional<EntidadPersona> persona = servicioPersona
					.getByIdentificacion(usuarioLogueado.getIdentificacion());
			EntidadVisita visita = new EntidadVisita();
			visita.setFecha(new Date());
			if (persona.isPresent())
			{
				visita.setResponsable(persona.get());
				entidad.setVisita(visita);
				
			}
			else
			{
				visita.setResponsable(null);
			}
		}
		return  super.create(entidad);
	}