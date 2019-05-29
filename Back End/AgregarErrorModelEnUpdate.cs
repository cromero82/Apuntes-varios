    //C:\Users\carlos.romero\Documents\t2\SaludSis\Areas\ADMIN\Controllers\SeguridadController.Personas.cs
    
    [HttpGet]
        public ActionResult UpdPersona(long Id)
        {
            var trans = new Transaction();

            
            
                // Acceso al Bl
                Bl = new Seguridad();
                trans = Bl.GetPersona(new { Id = Id });
                if (trans.State == TransState.Failure)
                {
                    ModelState.AddModelError("Error", trans.Message);
                    return PartialView();
                }

                var model = Slapper.AutoMapper.Map<Persona>(trans.Result);
                model.Id = Id;

                // Salida
                return PartialView(model);

        }