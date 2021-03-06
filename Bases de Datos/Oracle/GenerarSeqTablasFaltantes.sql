-- COLUMNAS QUE LES HACE FALTA SEQUENCIAS Y TIENEN CAMPO ID
SELECT DISTINCT( 
    CONCAT ( CONCAT('CREATE SEQUENCE ', table_name), '_SEQ  MINVALUE 1 START WITH 1  INCREMENT BY 1 CACHE 20;')
), column_name
FROM USER_TAB_COLUMNS
WHERE table_name NOT IN (select REPLACE(SEQUENCE_NAME,'_SEQ','') from user_sequences)
--and column_name 
AND column_name ='ID'
order by column_name
;

-- DES-USO
SELECT DISTINCT( 
    CONCAT ( CONCAT('CREATE SEQUENCE ', table_name), '_SEQ  MINVALUE 1 START WITH 1  INCREMENT BY 1 CACHE 20;')
)
FROM USER_TAB_COLUMNS
WHERE table_name NOT IN (select REPLACE(SEQUENCE_NAME,'_SEQ','') from user_sequences);
