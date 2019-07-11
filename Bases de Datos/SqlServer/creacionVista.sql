---------------------------------------------------------
-- Vista con información del usuario y establecimiento 
---------------------------------------------------------
--Create  View ViewSedeJornada AS
SELECT ROW_NUMBER() OVER (ORDER BY id) AS id, 
sedeId, sede, jornadaId, jornada, 
establecimientoId, establecimiento,
UserName, nombrePersona, apellidoPersona, numeroCelularPersona,  email,  emailRecuperacion,
 usuarioId, foto, escudo
from
(select
distinct(s.id),  s.id as sedeId, s.nombre as sede, j.id as jornadaId, dj.nombre as jornada, 
e.id as establecimientoId, e.nombre as establecimiento,
u.UserName, gp.nombres as nombrePersona, gp.apellidos as apellidoPersona, gp.numeroCelular as numeroCelularPersona, gp.correoelectronico as email, u.Email as emailRecuperacion,
u.Id as usuarioId , gap.nombre as foto, gae.nombre as escudo
FROM AspNetUsers  u with(NOLOCK)
--INNER JOIN AspNetUserRoles ur on ur.UserId =u.id
INNER JOIN seg_user_rol_establ ure on ure.net_user_id = u.Id
INNER JOIN gen_establecimiento e on ure.establecimiento_id = e.id
INNER JOIN seg_user_rol_estb_jorn urej on urej.user_rol_estab_id = ure.id
INNER JOIN gen_jornada j on urej.jornada_id = j.id
inner join dom_jornada dj on j.tipojornadaid = dj.id
INNER JOIN gen_sede s on j.sedeid = s.id
INNER JOIN seg_user_persona up on up.net_user_id = u.id
INNER JOIN gen_persona gp on up.persona_id = gp.id
INNER JOIN gen_archivos_personas gap on gp.foto_id = gap.id
INNER JOIN gen_archivos_establecimiento gae on gae.id = e.archivo_escudo_id
) X
