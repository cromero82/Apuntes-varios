@GetMapping(
      path = "/search",
      params = {"descripcionActividad","estado","pk"}
  )
  @ResponseStatus(HttpStatus.OK)
  public ResponseEntity<Page<DiagnosticoActividad>> search(EspecificacionEntidadDiagnosticoActividad specificaction,
      SortAndPagination sortAndPagination) {
	  UriComponentsBuilder builder = ServletUriComponentsBuilder.fromCurrentRequest();
	  String estado = builder.buildAndExpand().getQueryParams().getFirst("estado");
      String descripcionActividad = builder.buildAndExpand().getQueryParams().getFirst("descripcionActividad");
      String pk = builder.buildAndExpand().getQueryParams().getFirst("pk");
      System.out.println("descripcionActividad => " + descripcionActividad);
      System.out.println("estado => " + estado);
      System.out.println("pk => " + pk);
    return super.search(specificaction, sortAndPagination);
  }