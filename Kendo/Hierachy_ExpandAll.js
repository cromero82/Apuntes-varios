function estiloGlosasResueltas(e) {
    var view = this.dataSource.view();
    for (var i = 0; i < view.length; i++) {
        if (view[i].Estado == 'R') {           
            this.tbody.find("tr[data-uid='" + view[i].uid + "']")
                .addClass("k-state-disabled");
        }
    }
    handleAjaxModal();
    //var gridGlosasForm = $("#gridGlosasFormula").data("kendoGrid");
    //gridGlosasForm.find(".k-hierarchy-cell, .k-hierarchy-col").hide();
    var grid = this;

    //expand all detail rows
    grid.tbody.find("tr.k-master-row").each(function (e) {        
        var detailRow = $(this).closest('tr');
        var table = $(this).closest('div.k-grid');
        var detailGrid = $(table).data('kendoGrid');
        //var allSelected = detailGrid.select();
        var data1 = detailGrid.dataItem(detailRow);
        if (data1.Id != 281) {
            //.find("td.k-hierarchy-cell .k-icon").removeClass()
            //grid.expandRow($(this));
            //grid.tbody.find("tr.k-master-row>.k-hierarchy-cell>a").hide();
            grid.tbody.find("tr.k-master-row> .k-icon").removeClass();
        }
       
    });

    ////remove hierarchy cells and column
    //$(".k-hierarchy-cell").remove();
    //$(".k-hierarchy-col").remove();
}