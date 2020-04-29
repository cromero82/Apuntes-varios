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
