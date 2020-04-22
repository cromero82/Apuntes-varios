// Cuando el select no tiene asignado un elemento formControl se puede realizar mediante una variable
// [disabled] = "booleanVar" en el html
// pero de lo contrario se debe usar dicho elemento para controlarlo

// Finalmente no me quedo tan claro cual funciona
this.formularioTransicion.get('responsable').value(null);
this.formularioTransicion.controls['responsable'].setValue(null);

// Para deshabilitarlo
 this.formularioTransicion.controls['observacion'].enable();
