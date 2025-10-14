@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface Lectores enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Lectores_Enatt
  as select from ZR_Clientes_Lectores_Enatt_TP
  association [1..*] to ZR_Clientes_Libreria_Enatt_TP as _ClientesLibreria on $projection.Lector = _ClientesLibreria.Lector
{
  key Cliente as Lector,
      Nombre,
      Apellidos,
      Email,
      Imagen,
      TipoAcceso,
      _ClientesLibreria.Libro
      
}
