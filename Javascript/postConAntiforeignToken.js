function revisionBotonesCargarGrid(e) {   
    var view = this.dataSource.view();    
    if (view.length > 0) {       
        conciliacionId = view[0].Id;
        $.ajax({
            method: "POST",
            url: "/MED/Auditoria/VerificarGlosaConciliacionActual/",
            data: {
                dconciliacionId: view[0].Id,
                conciliacionId: $("#conciliacionId").val(),
                __RequestVerificationToken: window.RequestVerificationToken
            },
            success: function (result) {
                if (result.Success) {
                    if (result.Result.Actual > 0) {
                        $("#btnRegistrar").hide();
                        $("#btnContinuar").show();
                    } else {
                        $("#btnRegistrar").show();
                        $("#btnContinuar").hide();
                    }
                }
            },
            error: function () {
                $.msgbox(result.Message, { type: "error" });
            }
        });
    }    
}