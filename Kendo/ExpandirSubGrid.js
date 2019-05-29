function verOcultarAnexo(idGlosa) {
    var grid = $("#gridGlosas").data("kendoGrid");
    var allMasterRows = grid.tbody.find('>tr.k-master-row');
    var view = grid.dataSource.view();
    for (var i = 0; i < view.length; i++) {
        if (view[i].Id == idGlosa) {
            var est = allMasterRows.eq(i).next('tr.k-detail-row');
            if (est.length == 0) {
                grid.expandRow(allMasterRows.eq(i));
            } else {
                grid.collapseRow(allMasterRows.eq(i));
            }
            //         
        }
    }    
}