var cantColumnas = 0;
function estiloFilasDeshabilitadas(e) {
    var view = this.dataSource.view();
    for (var i = 0; i < view.length; i++) {
        if (view[i].Estado == 'Inactivo') {
            var celdas = this.tbody.find("tr[data-uid='" + view[i].uid + "'] > td");
            cantColumnas = celdas.length;            
            celdas.each(function () {
                var este = $(this);
                
                if ($(this).index() != cantColumnas -1) {
                    $(this).addClass('k-state-disabled');
                }
            });
        }
    }