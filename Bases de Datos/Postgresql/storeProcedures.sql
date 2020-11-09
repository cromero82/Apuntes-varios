/***** Define ****/
CREATE OR REPLACE FUNCTION avance_pregunta_usuario(usuario_id int) RETURNS refcursor AS $$
DECLARE
        ref_cursor REFCURSOR := 'mycursor';
BEGIN
        OPEN ref_cursor FOR select ROW_NUMBER () OVER ( ) as id, usuario_estudiante_id, date_trunc('day',fecha_creacion) as fecha, tipo_avance as tipo, count(tipo_avance) as cantidad
                from avance_pregunta
        where usuario_estudiante_id = usuario_id
                group by usuario_estudiante_id, date_trunc('day',fecha_creacion), tipo_avance
                order by date_trunc('day',fecha_creacion), tipo_avance
limit 10;
        RETURN (ref_cursor);
END;
$$ LANGUAGE plpgsql;

/***** Calling ****/
BEGIN;
SELECT avance_pregunta_usuario(6);
FETCH 4   from  mycursor;
COMMIT;
