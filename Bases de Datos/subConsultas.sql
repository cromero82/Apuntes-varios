 select 
     esm_disp.nombre
     ,fuer_disp.nombre
     ,count( distinct(formmedin.consecutivo)) as CANTIDAD_FORMULAS                                                      
     ,sum (dmov.cantidad) as CANT_UNIDADE_PEND_DESCARGADAS          
     ,sum((SELECT sum(dmovi.total) from med_dmovimientos dmovi where dmovi.movimientos_id = mov.id and dmovi.vintermediacion > 0  ))  AS VALOR_PEND_ENTREG_CON_INTERM
     ,sum((SELECT sum(dmovi.total) from med_dmovimientos dmovi where dmovi.movimientos_id = mov.id and dmovi.vintermediacion = 0  ))  AS VALOR_PEND_ENTREG_SIN_INTERM     
     ,sum (mov.vtotal) as VALOR_TOTAL

        from hcl_formmedicas formu
        inner join hcl_formmedinsumos formmedin
          on formu.id = formmedin.formmedicas_id
        inner join hcl_dformmedinsumos dformmedin
               on formmedin.id =dformmedin.formmedinsumos_id
         inner join med_dmovimientos dmov
         on dformmedin.id =decode(dmov.dformmedinsumos_id,null,(select hcldfmi.id from  hcl_dformmedinsumos hcldfmi 
         inner join enf_dsolicitudes enfds on enfds.hcl_dformmedinsumos_id=hcldfmi.id and enfds.id=dmov.dsolicitudes_id),
         dmov.dformmedinsumos_id)
         INNER join med_movimientos mov
          on dmov.movimientos_id = mov.id          
          left join med_tmovimientos tmov
        on tmov.id= mov.tmovimientos_id and ( tmov.sigla='DA')       
       left join med_bodegas bod
          on bod.id = mov.bodegas_id
       left join gen_uorg esm_disp
          on esm_disp.id = bod.uorg_id             
       left join gen_fuerzas fuer_disp
          on fuer_disp.id = esm_disp.fuerza_id                          
group by    esm_disp.nombre, fuer_disp.nombre;

-----------------------------------

             Select  
               (select hfmi.estado from  HCL_FORMMEDINSUMOS hfmi where hfmi.formmedicas_id = hfm.id FETCH FIRST 1 ROWS ONLY) as ESTADO_CONSECUTIVO_FORMULA ,              
             hfm.id as xxx,
                es.id as SOLICITUD_ID,
                gpp.id as PERSONA_PACIENTE_ID,
                gpp.documento as DOCUMENTO_PACIENTE,
                es.fecha as FECHA_SOLICITUD,
                gpp.PRIMER_NOMBRE || ' '|| gpp.SEGUNDO_NOMBRE || ' '|| gpp.PRIMER_APELLIDO || ' '|| gpp.SEGUNDO_APELLIDO as PACIENTE, 
                gpm.PRIMER_NOMBRE || ' '|| gpm.SEGUNDO_NOMBRE || ' '|| gpm.PRIMER_APELLIDO || ' '|| gpm.SEGUNDO_APELLIDO as MEDICO,                                      
                DECODE(gipC.nombre || ' | ' || gipH.nombre,' | ','',gipC.nombre || ' | ' || gipH.nombre) as CAMA_HABITACION,
                DECODE(giuoP.infraestructura || ' | ' || giuoT.Infraestructura,' | ','',giuoT.Infraestructura || ' | ' || giuoP.infraestructura) as TORRE_PISO,
                ees.sigla as SIGLA_ESTADO_SOLICITUD,
                ees.nombre as ESTADO_SOLICITUD,
                ga.id as PACIENTE_ID
              From    enf_solicitudes es
        LEFT join enf_estdsolicitudes ees on (es.estdsolicitudes_id = ees.id and ees.estregistro = 1 )
        LEFT join hcl_formmedicas hfm on (es.formulacion_medicas_id = hfm.id and hfm.estregistro_id = 1)
                             INNER JOIN HCL_PROCESOSASISTENCIALES hp ON ( hfm.PROCESOSASISTENCIALES_ID = hp.ID AND hp.ESTREGISTRO_ID = 1  )                          
                             INNER JOIN GEN_UORG guo ON ( es.uorg_id = guo.ID AND guo.ESTREGISTRO_ID = 1  AND guo.ESTREGISTRO_ID = 1 )    
                             --Medico
                              INNER JOIN GEN_USUARIOS gu ON ( hp.USUARIOS_ID = gu.ID  and gu.estregistro_id = 1)                
                              INNER JOIN GEN_PERSONAS gpm ON ( gu.PERSONAS_ID = gpm.ID  and gpm.estregistro_id = 1)
                             --Paciente
                              INNER JOIN GEN_PERSONAS gpp ON ( hp.personas_id = gpp.ID  and gpp.estregistro_id = 1) 
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
              where           es.estregistro_id = 1 --AND                                  
                    --guo.id = 79
            ORDER BY
                    es.fecha desc