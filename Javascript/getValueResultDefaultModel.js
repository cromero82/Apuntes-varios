function consultarTotales() {    
    $.post("/MED/Auditoria/GetTotalesFormulaGlosa", { MovimientoDispensacionId: $("#movimientoDispensacionId").val(), FormedInsumoId: $("#formedInsumoId").val() },
                function (result) {
                    if (result.Success == true) {
                        var resValue = kendo.toString(result.Result[1].Value, 'c2');//result.Result.ValorTotalGlosado;
                        $("#idTotalGlosado").html(resValue);
                    } else {
                        var errorMsg = result.Message;
                        $.msgbox(errorMsg, { type: "error" });
                    }
                });
}