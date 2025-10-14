@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface Ventasa Libros enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Ventas_Libros_Enatt
  as select from ZR_Clientes_Libreria_Enatt_TP
  association[1..1] to ZI_Lectores_por_Libro_Enatt as _Lectores on $projection.Libro = _Lectores.Libro
{
  key Libro,
      count( * ) as CantidadVendida,
  _Lectores    
}
group by
  Libro
