@*Guardar Elemento consumo*@
<script>
    titan.armamento.devolucion.SaveElementoConsumo = function (e) {
        e.model.DEVOLUCION_ELEM_CONSUMO_CANTIDAD_DEVUELTA = $("#DEVOLUCION_ELEM_CONSUMO_CANTIDAD_DEVUELTA").data("kendoNumericTextBox").value();
        // Permite determinar si al kGrid de funconarios discriminados se le agregaron registros
        // , entonces se forza la actualizacion de la transaccion (independientemente si se realizo modificacion en los demas elementos del formulario modal o no)
        if (e.model.CRUD_DISCRIMINADO != $("#CRUD_DISCRIMINADO").val()) {
            e.model.dirty = true;
        }
        e.model.CRUD_DISCRIMINADO = $("#CRUD_DISCRIMINADO").val()
    }
</script>