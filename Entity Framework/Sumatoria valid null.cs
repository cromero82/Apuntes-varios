var subtotalOtras = queryElementoBaja.Where(w => w.MOTIVO_NOVEDAD_ID != 73874 || w.MOTIVO_NOVEDAD_ID != 18880).Sum(s => (decimal?)s.CANTIDAD_TOTAL)??0;