dialogRef.beforeClosed().subscribe(val => {
      if (val == 1) {
      // Here solution
        for (let key in this.lista) {
          this.lista[key] = this.clone[key];
        }
        this.dialogRef.close();
      }
    });
