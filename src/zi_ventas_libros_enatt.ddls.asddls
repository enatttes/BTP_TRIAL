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
  as select from ZR_Clientes_Libreria_Enatt
{
  key Libro,
      count( * ) as CantidadVendida
}
group by
  Libro
