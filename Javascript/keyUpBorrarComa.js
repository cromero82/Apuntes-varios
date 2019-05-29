$("#SINIESTRO_INDEMNIZACION_DEDUCIBLE")
            .keyup(function (e) {                
                // si se teclea "," entonces se borra dicho caracter
                if (e.keyCode == 188) {
                    this.value = this.value.split(',').join('')
                } else {
                    titan.armamento.Siniestro.calcularIndemnizacion()
                }
                
            })