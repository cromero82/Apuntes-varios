
// -----------------------------    Creación de la clase como servicio
import { FormGroup } from '@angular/forms';
import { UtilitiesService } from '../services/utilities.service';

export class TimeValidator {

    static timeMin(grupo: FormGroup) {
        let utilitiesService = new UtilitiesService();
        let formato = 'YYYY-MM-DD HH:mm';
        if (grupo.controls.hasOwnProperty('horaInicio') && grupo.controls.hasOwnProperty('horaFin')) {
            let horaInicio = utilitiesService.convertStringToDate(
                utilitiesService.clearHora(grupo.get('horaInicio').value), formato
            );
            let horaFin = utilitiesService.convertStringToDate(
                utilitiesService.clearHora(grupo.get('horaFin').value), formato
            );

            if (horaInicio && horaFin) {
                if (horaInicio > horaFin) {
                    grupo.get('horaInicio').setErrors({ errorHoraMinMayor: true });
                    return null;
                }
            }

            grupo.get('horaInicio').setErrors(null);
            return null;
        }
    }
}

// -------------------------- usarla en componentes
import { TimeValidator } from 'src/app/shared/form/time.validator';
