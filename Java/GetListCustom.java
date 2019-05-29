
/// On controller
@GetMapping( path = "/procesos/{nombreProceso}/objeto/{objetoId}/transicion/{transicionId}/usuarios")
	public ResponseEntity<List<UsuarioAuditoria>> usuariosTransicionObjeto(@PathVariable("nombreProceso")String nombreProceso, @PathVariable("objetoId")Long objetoId,
			@PathVariable("transicionId")Long transicionId) {
		List<EntidadUsuario> usuarios = (List<EntidadUsuario>) servicioUsuarios.findAllUsuariosByTransicion(transicionId);
		List<UsuarioAuditoria> result = usuarios.stream().map(entity -> convertEntityUsuarioToResourceUsuario(entity)).collect(Collectors.toList());
		return new ResponseEntity<List<UsuarioAuditoria>>(result,HttpStatus.OK);
	}
	
// On Service
 public List<EntidadUsuario> findAllUsuariosByTransicion( Long transicionId) {
		return repositorio.findAllUsuariosByTransicion (transicionId);
	}

// On repository
@Query(value = "SELECT U.*\r\n" + 
		"FROM USUARIO U\r\n" + 
		"INNER JOIN  USUARIO_ROL UR ON ur.usuario_id = U.ID\r\n" + 
		"INNER JOIN ROL R ON UR.ROL_ID = R.ID\r\n" + 
		"INNER JOIN ROL_PERMISO RP ON RP.ROL_ID = R.ID\r\n" + 
		"INNER JOIN PERMISO P ON rp.permiso_id = P.ID \r\n" + 
		"INNER JOIN PROCESO_TRANSICION PT ON pt.permiso_id = P.ID\r\n" + 
		"WHERE pt.ID = :transicionId", nativeQuery = true)
List<EntidadUsuario> findAllUsuariosByTransicion(@Param("transicionId") Long  transicionId);