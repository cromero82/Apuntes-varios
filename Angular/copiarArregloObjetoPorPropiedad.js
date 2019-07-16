// Envian parametros
editItem(pos:number, listaItem: ListaItem): void {
    this.cloneListaItem = JSON.stringify(listaItem);
    const dialogConfig = new MatDialogConfig();
    dialogConfig.width = '60%';
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    // Here solution (send data)
    dialogConfig.data = {
      lista: this.lista,
      listaItem: listaItem,
      pos: pos
    };
    const dialogRef = this.dialog.open(ListasItemsEditComponent, dialogConfig);
  }

// Reciben parametros
/*export class ListasItemsEditComponent implements OnInit {
  listaItems: ListaItem;
  lista: Lista;
  cloneListaItem:any;
  pos: number; 
  form: FormGroup;
  disabledBtn_Login = false;
  constructor(
    private snackBar: MatSnackBar,
    private dialogRef: MatDialogRef<ListasItemsEditComponent>,
    private fb: FormBuilder,
    private servicio: ListaItemsService,
    private servicioLista: ListasService,
    @Inject(MAT_DIALOG_DATA) data: any ) {*/
    
    // Here solution: Get data.
    this.lista = data['lista'];
    this.listaItems = data['listaItem'];
    this.pos = data['pos'];
