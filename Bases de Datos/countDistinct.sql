select 
     esm_disp.nombre
     ,count( distinct(formmedin.consecutivo)) as CANTIDAD_FORMULAS                                                      
     ,sum (dmov.cantidad) as CANT_UNIDADE_PEND_DESCARGADAS          
--     ,sum((SELECT sum(dmovi.total) from med dmovi where dmovi.movimientos_id = mov.id and dmovi.vintermediacion > 0  ))  AS VALOR_PEND_ENTREG_CON_INTERM
--     ,sum((SELECT sum(dmovi.total) from med_dmovimientos dmovi where dmovi.movimientos_id = mov.id and dmovi.vintermediacion = 0  ))  AS VALOR_PEND_ENTREG_SIN_INTERM     
     ,sum (mov.vtotal) as VALOR_TOTAL
     , gentf.nombre
     , nvl((SELECT LISTAGG(tcaract.sigla, '; ') WITHIN GROUP(ORDER BY tcaract.sigla)      
from med_caractdproductos caract
inner join med_tcaracteristicas tcaract
on tcaract.id = caract.tcaracteristicas_id
where caract.estregistro_id = 1
and caract.dproductos_id = dprod.id),' ') as CARACTERISTICAS_MEDICAMENTO

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
       inner join gen_tformulas gentf
          on gentf.id=formu.tformulas_id  
     ----
     left join med_inventarios inv
          on inv.id = dmov.inventarios_id
        left join med_dcontratos dcon 
       on  dcon.id=inv.dcontratos_id 
       left join med_hdcontratos hdcon
       on hdcon.dcontratos_id=dcon.id and dmov.hdcontratos_id=hdcon.id
       left join med_tcaracteristicas tcarac
       on tcarac.id=hdcon.tcaracteristicas_id 
     ---
     
     left join med_productos prod
          on prod.id = inv. productos_id
          
    left join med_dproductos dprod
          on dprod.productos_id = prod.id      
     
                           
group by    esm_disp.nombre,  gentf.nombre,