SELECT DISTINCT( 
   
   concat(
   concat( 'select nvl(max(id) + 1, 1) from ', table_name),
        CONCAT(  CONCAT ( CONCAT('; CREATE SEQUENCE ', table_name), '_SEQ  MINVALUE 1 START WITH here_max_id_mas_1_  INCREMENT BY 1 CACHE 20;'),  
            CONCAT('   UPDATE  ' , CONCAT( table_name, ' SET id = MENU_SEQ.nextval;'))
        )
    )
)
FROM USER_TAB_COLUMNS
WHERE table_name NOT IN (select REPLACE(SEQUENCE_NAME,'_SEQ','') from user_sequences)  AND  COLUMN_NAME  = 'ID'
--order by TABLE_NAME
;
