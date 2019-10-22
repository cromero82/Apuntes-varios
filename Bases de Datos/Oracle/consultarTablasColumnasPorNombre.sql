SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS
where column_name like '%ESTADO%'
