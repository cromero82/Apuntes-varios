for(DiagnosticoMuestreo itemMuestreo:muestreos ) {
						// si existe en falla
						boolean muestreoExisteEnFalla = false;
						int posFalla = 0;
						for(DiagnosticoFalla itemFalla:fallaMod ) {							
							if(itemFalla.getUnidadMuestreo().equals(itemMuestreo)) {
								muestreoExisteEnFalla = true;
								break;
							}
							posFalla++;
						}
						if(!muestreoExisteEnFalla) {
							DiagnosticoFalla newItemFalla = new DiagnosticoFalla();
							newItemFalla.setId(cont);
							newItemFalla.setUnidadMuestreo(itemMuestreo);
							fallasModAux.add(newItemFalla);
							
						}else {
							fallaMod.get(posFalla).setId(cont);
						}
						cont++;
					}
