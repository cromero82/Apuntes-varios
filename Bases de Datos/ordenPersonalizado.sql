Select 
es.id as SOLICITUD_ID,
es.fecha as FECHA_SOLICITUD,
decode((select hfmi.estado from HCL_FORMMEDINSUMOS hfmi where hfmi.formmedicas_id = hfm.id FETCH FIRST 1 ROWS ONLY) || ees.sigla ,'PendienteA','1','ParcialA','2','PendienteC','3','ParcialC','4','5') as orden

From enf_solicitudes es
inner join enf_estdsolicitudes ees on (es.estdsolicitudes_id = ees.id and ees.estregistro = 1 )
inner join hcl_formmedicas hfm on (es.formulacion_medicas_id = hfm.id and hfm.estregistro_id = 1)
INNER JOIN HCL_PROCESOSASISTENCIALES hp ON ( hfm.PROCESOSASISTENCIALES_ID = hp.ID AND hp.ESTREGISTRO_ID = 1 ) 
INNER JOIN GEN_UORG guo ON ( es.uorg_id = guo.ID AND guo.ESTREGISTRO_ID = 1 AND guo.ESTREGISTRO_ID = 1 ) 
--Medico
INNER JOIN GEN_USUARIOS gu ON ( hp.USUARIOS_ID = gu.ID and gu.estregistro_id = 1) 
INNER JOIN GEN_PERSONAS gpm ON ( gu.PERSONAS_ID = gpm.ID and gpm.estregistro_id = 1)
--Paciente
INNER JOIN GEN_PERSONAS gpp ON ( hp.personas_id = gpp.ID and gpp.estregistro_id = 1) 
LEFT JOIN GEN_AFILIADOS ga on (ga.personas_id = gpp.id and ga.estregistro_id = 1)

-- Lo demas 
INNER JOIN ADM_ESPTRATANTES aet ON (hp.ESPTRATANTES_ID = aet.ID AND aet.ESTREGISTRO_ID = 1) 
INNER JOIN ADM_SERVTRATANTES ast ON (aet.SERVTRATANTES_ID = ast.ID AND ast.ESTREGISTRO_ID = 1) 

LEFT JOIN SALUDSIS.ADM_ASIGNACIONCAMAS aac
ON (aac.servtratantes_id = ast.id and
aac.id = (select max(asi.id)
from adm_asignacioncamas asi
where asi.servtratantes_id = ast.id))
LEFT JOIN SALUDSIS.ADM_DASIGNACIONCAMAS adac
ON (aac.id = adac.asignacioncamas_id and
adac.id = (select max(id) from adm_dasignacioncamas where estado = 'Activo')
)
LEFT JOIN SALUDSIS.GEN_INFRPISOS gipC -- Cama
ON (aac.INFRPISOS_ID = gipC.ID)
LEFT JOIN SALUDSIS.GEN_INFRPISOS gipH -- Habitación
ON (gipC.padre_id = gipH.id) 
LEFT JOIN GEN_INFRUORG giuoP ON (gipc.uorg_infr_id = giuoP.id) -- Piso
LEFT JOIN GEN_INFRUORG giuoT ON (giuoP.Padre_Id = giuoT.id) -- Torre
where es.estregistro_id = 1 AND 
guo.id = 79
ORDER BY
orden, es.fecha desc