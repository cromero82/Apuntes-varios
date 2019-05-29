  /// <summary>
        /// Obtiene una lista de caracteristicas (agrupador de instituciones educativas) para presentarla en un grid
        /// </summary>
        /// <param name="request"> Filtros en cliente </param>
        /// <returns>lista de datos</returns>
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult GetListTcaracteristicas([DataSourceRequest]DataSourceRequest request)
        {
            var listaBl = new TlistasBL();
            var jresult = listaBl.GetListTcaracteristicas();
            if (jresult.Success == false)
            {
                ModelState.AddModelError("Error", "Error consultando datos: " + jresult.Message);
                return Json(Enumerable.Empty<object>().ToDataSourceResult(request, ModelState));
            }
            return Json(new DataSourceResult { Data = jresult.Result, Total = jresult.Result.Count });
        }