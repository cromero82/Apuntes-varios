// Deshabilitarlo desde el inicio
this.form = this.formBuilder.group({
      
      //'celular': [null, Validators.compose([Validators.maxLength(10)])],
      'placa': [{value: null, disabled: true}, null],
      //'diasSemana': [null, Validators.compose([Validators.required])],
    });

// Deshabilitarlo en tiempo de ejecución
this.form.controls['diasSemana'].disable();
