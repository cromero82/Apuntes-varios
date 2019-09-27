@NoArgsConstructor
@Builder
@VisitaTransicionConstraint(message = "La transición 'Enviar a registrar visita de diagnostico', no existe en el sistema")
@VisitaHorariosConsecutivoConstraint(message = "El horario de trabajo del equipo debe ser consecutivo")
@VisitaFeriadosConstraint(message = "La visita no se puede programar para días sábados, domingos o festivos")
public class Visita extends BaseResource {

	private Long id;
	
	@JsonFormat(
	    shape = JsonFormat.Shape.STRING,
	    pattern = "dd-MM-yyyy",
	    locale = "es-CO",
 		timezone = "America/Bogota"
	)
	private Date fecha;
	
	@Builder.Default
	private Boolean activo = true;
	
  
  // ********* HERE Referenced FIELD
  // **********************************************
	@JsonBackReference("visita")
	private Persona responsable;
  // Anothers fields ....
  }
  
  // ******************************************************************
  // ***********************  AND ANOTHER ENTITY WITH FIELD REFERENCED
  // ******************************************************************
  
package org.umv.sigma.app.administracion.personas.resources;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;
import org.umv.sigma.app.administracion.personas.validations.constraints.PersonaIdentificacionConstraint;
import org.umv.sigma.app.administracion.personas.validations.constraints.PersonaUsuarioConstraint;
import org.umv.sigma.app.core.listas.resources.ListaItemInfo;
import org.umv.sigma.app.core.usuarios.resources.UsuarioInfo;
import org.umv.sigma.app.mejoramiento.visitas.resources.Visita;
import org.umv.sigma.common.abstracts.resources.BaseResource;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@PersonaIdentificacionConstraint(message = "El número de identificación ya existe")
@PersonaUsuarioConstraint(message = "El usuario ya esta relacionado a una persona existente")
public class Persona extends BaseResource {

	private Long id;

	@Builder.Default
	private Boolean activo = true;
  
  // another fields...

	private UsuarioInfo usuario;
	
  // ********* HERE Referenced FIELD
  // **********************************************
	@JsonBackReference("visita")
	private Visita visita;
	
	private String color; 
}
