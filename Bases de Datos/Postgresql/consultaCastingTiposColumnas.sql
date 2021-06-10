select * from "USUARIO" u 
  inner join "USUARIO_AGENTE" ua
	on 	ua."USUARIO"  = u."ID"::varchar
where u."IDENTIFICACION"  = '86070384';
