@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface Clientes Libreria enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Clientes_Libreria_Enatt
  as select from ZR_Clientes_Libreria_Enatt
  association [1..*] to ZI_Clientes_Lectores_Enatt as _Lectores on $projection.Libro = _Lectores.Libro
{
  key Libro,
      Lector,
      _Lectores

}
