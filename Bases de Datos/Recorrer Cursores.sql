---------------------------------------
--- RECORRER CURSORES
---------------------------------------

PROCEDURE GetTotalesFormulaGlosa(formed_insumos_id_        in number,
                                 cant_glosas_              OUT number,
                                 valor_total_glosado_      OUT number,
                                 valor_total_cobrado_form_ OUT number,
                                 sproc_                    OUT sp.Sproc) IS

  CURSOR cur_glosas(formed_insumos_id_ in number) is
    SELECT mg.VALOR
      FROM SALUDSIS.MED_GLOSAS mg
     INNER JOIN SALUDSIS.MED_TGLOSAS mtg
        ON (mg.TGLOSAS_ID = mtg.ID)
     INNER JOIN SALUDSIS.MED_AUDITFORMULAS maf
        ON (mg.AUDITFORMULAS_ID = maf.ID AND maf.ESTREGISTRO_ID = 1)
      LEFT OUTER JOIN SALUDSIS.MED_AUDITMEDICAMENTOS mam
        ON (mg.AUDITMEDICAMENTOS_ID = mam.ID AND mam.ESTREVISION = 1)
     WHERE mg.ESTREGISTRO_ID = 1
       AND mtg.ESTREGISTRO_ID = 1
       AND maf.FORMMEDINSUMOS_ID = formed_insumos_id_;
BEGIN
  valor_total_cobrado_form_ := 0;
  valor_total_glosado_      := 0;
  cant_glosas_              := 0;

  -----------------------------------------------------------------
  -- Bloque Obtiene el total fórmula, recorriendo el movimiento de dispensacion
  ------------------------------------------------------------------   
  FOR i in cur_glosas(formed_insumos_id_) loop
    valor_total_glosado_ := valor_total_glosado_ + i.valor;
    cant_glosas_         := cant_glosas_ + 1;
  end loop;

  -----------------------------------------------------------------
  -- Bloque Obtiene el total fórmula, recorriendo el movimiento de dispensacion
  ------------------------------------------------------------------   
  FOR j in cur_movimientos_medicamentos(formed_insumos_id_) loop
    valor_total_cobrado_form_ := j.total_formula;
  end loop;

  -----------------------------------------------------------------
  -- Bloque valida que el valor glosado no supere el valor_cobrado
  ------------------------------------------------------------------   
  IF valor_total_glosado_ > valor_total_cobrado_form_ THEN
    valor_total_glosado_ := valor_total_cobrado_form_;
  END IF;

  ---------------------
  -- Salida SUCCESS
  ---------------------
  sp.setSuccess(sproc_, Utils.GetMessage('NTF0002'));

exception
  when others then
    ---------------------
    -- Salida FAILURE
    ---------------------
    sp.setFailure(sproc_, Utils.GetMessage('ERR0002'));  
END;