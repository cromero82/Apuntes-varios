 // usando el form
  this.formularioTerminarGestion = this.formBuilder.group({
      // ...
      'proceso': [null, Validators.compose([Validators.required])],
      'actividadFin': [null, Validators.compose([Validators.required])],
      'estadoPkActual': [{ value: null, disabled: true }],
     //....
    });
 
 
 
 ngOnInit() {
 // another init statements...
 this.formularioReasignarActividad.get('proceso').valueChanges.subscribe(
      procesoSelected => {
        debugger;
        if (procesoSelected && this.formularioReasignarActividad.valid === false) {
          this.procesoSelectedToFinalActivity(procesoSelected.id, 'Reasignar');
        }
      }
    );
}
