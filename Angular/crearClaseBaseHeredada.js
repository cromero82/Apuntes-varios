// Tener en cuenta si se utilizan servicios inyectados
// -----------------------------
// La clase base
import { MaxDecimalValue } from 'src/app/shared/form/number.validator';

export class BaseFallas {
// ..Here properties
// not constructor or empty
// .. Here methods 
}

// -----------------------------
// la clase heredada
// .. Here another imports
import { BaseFallas } from '../fallas/base-fallas';

@Component({
  selector: 'app-fallas',
  templateUrl: './fallas.component.html'
})
export class FallasComponent extends BaseFallas implements OnInit {
constructor(
    formBuilder: FormBuilder,
    // .. Here services
  ) {
    // Invocación del constructor padre
    super();
    }
 // Here another methdos
}


// --------------------------------------------------------------
// Ejemplo con servicios inyectados
// --------------------------------------------------------------


export abstract class MenuBase {
    servicio: MenuadminService;
    authService: AuthService;
    // ... Def others services
    //... parameters

    constructor(
        servicio: MenuadminService,
        authService: AuthService,
        // ... others services
    ) {
        this.servicio = servicio;
        this.authService = authService;
        // ... Init others services
    }
    // body ..
}

export class MenuCreateComponent extends MenuBase implements OnInit  {
  constructor(
    // definicion local others services not in Base class
    private servicioPermiso: PermisosService,
     
    servicio: MenuadminService,
    authService: AuthService
     )
     {
    super(servicio, authService /*, others services */);
     }
}

     
