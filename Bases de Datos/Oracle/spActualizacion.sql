create or replace procedure  spCopiarDuraplaneadaEvalCond
as
    mantenimiento_id PROGRAMACION_PERIODICA.MANTENIMIENTO_ID%TYPE;
    duracion_planeada PROGRAMACION_PERIODICA.DURACION_PLANEADA%TYPE;
 CURSOR  cur_prog_periodica IS
     select  MANTENIMIENTO_ID, DURACION_PLANEADA
    from PROGRAMACION_PERIODICA;
begin
    OPEN cur_prog_periodica;
    LOOP
        FETCH cur_prog_periodica INTO mantenimiento_id, duracion_planeada;
        --DBMS_OUTPUT.PUT_LINE(mantenimiento_id+'');
        --DBMS_OUTPUT.PUT_LINE('testing');
        --DBMS_OUTPUT.PUT_LINE(' spCopiarDuraplaneadaEvalCond correcto: mantenimiento_id:' + mantenimiento_id + ', duracion:' + duracion_planeada);
        update EVALUACION_CONDICION ec set ec.DURACION_PLANEADA = duracion_planeada where MANTENIMIENTO_ID = mantenimiento_id;
        dbms_output.put_line(' update EVALUACION_CONDICION ec set ec.DURACION_PLANEADA = '|| duracion_planeada || ' where MANTENIMIENTO_ID = '|| mantenimiento_id||'; ');
        --COMMIT;
        --DBMS_OUTPUT.PUT_LINE(' spCopiarDuraplaneadaEvalCond correcto: mantenimiento_id:' + mantenimiento_id + ', duracion:' + duracion_planeada);
        exit when cur_prog_periodica%NOTFOUND;
    end loop;
    CLOSE cur_prog_periodica;
end;

begin spCopiarDuraplaneadaEvalCond(); commit; end;

drop procedure  spCopiarDuraplaneadaEvalCond;

select pk, DURACION_PLANEADA from EVALUACION_CONDICION where DURACION_PLANEADA is not null;

update EVALUACION_CONDICION ec set ec.DURACION_PLANEADA = 62.84 where MANTENIMIENTO_ID = 145840;
