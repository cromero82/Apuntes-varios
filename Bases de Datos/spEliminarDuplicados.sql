-----------------------------------------------------------------------
--  1. Definicion de StoreProcedure (Desde sql developer o consola) (sin usar paquetes)
-----------------------------------------------------------------------
create or replace PROCEDURE eliminarPaisesDuplicados(idPadre in number)
IS
--Definicion de variables (incluyendo cursores)
CURSOR cur_paises(padreId in number) is
SELECT count(DESCRIPCION) CANT, LISTA_ID, VALOR, DESCRIPCION
FROM LISTA_ITEM 
WHERE LISTA_ID=padreId
GROUP BY LISTA_ID, VALOR, DESCRIPCION
HAVING COUNT(DESCRIPCION) > 1;

-- Cursor por registro Repetido
CURSOR cur_paisesRepetidos(valorIn in varchar, descripcionIn in varchar) is
SELECT * FROM LISTA_ITEM WHERE VALOR = valorIn AND DESCRIPCION = descripcionIn;

BEGIN
  -----------------------------------------------------------------
  -- Ejecucion
  ------------------------------------------------------------------   
  FOR listaPaises in cur_paises(idPadre) loop    
    FOR paisRepetido in cur_paisesRepetidos(listaPaises.VALOR, listaPaises.DESCRIPCION) loop
        delete from lista_item where lista_id= idPadre and valor = listaPaises.VALOR AND descripcion = listaPaises.descripcion;
        DBMS_OUTPUT.PUT_LINE('Eliminacion de Valor: '|| listaPaises.VALOR || ' - Descripcion: ' || listaPaises.DESCRIPCION);
    end loop;    
  end loop;
END;


-----------------------------------------------------------------------
--  2. Llamado del StoreProcedure (desde sql developer o consola) 
-----------------------------------------------------------------------
exec  ELIMINARPAISESDUPLICADOS(314);
--exec  ELIMINARPAISESDUPLICADOS( SELECT ID FROM LISTA WHERE NOMBRE = 'UMV_BARRIOS' AND ACTIVO = 1 AND ELIMINADO = 0 );
