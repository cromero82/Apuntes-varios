SELECT uo1.object_name
      FROM (SELECT object_id, referenced_object_id
              FROM public_dependency
             WHERE referenced_object_id <> object_id) pd,
           all_objects uo1
     WHERE uo1.object_id = pd.object_id
CONNECT BY PRIOR pd.object_id = pd.referenced_object_id
START WITH pd.referenced_object_id IN (SELECT object_id
                                         FROM all_objects
                                        WHERE     object_name = 'DIAGNOSTICO_ENCABEZADO'  -- NOMBRE TABLA
                                              AND owner =  'SIGMA_ARQ' ) --ESQUEMA
