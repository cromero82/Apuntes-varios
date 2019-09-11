-- For oracle 11G-
select hfmi.estado from  HCL_FORMMEDINSUMOS hfmi where hfmi.formmedicas_id = hfm.id FETCH FIRST 1 ROWS ONLY

-- For oracle 12C+
select * from lista_item where ID>0 AND ROWNUM <= 1
