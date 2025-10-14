@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface Clientes Lectores enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Clientes_Lectores_Enatt
  as select from ZR_Clientes_Lectores_Enatt_TP
  association [0..*] to ZI_Clientes_Libreria_Enatt as _Lectores on $projection.Lector = _Lectores.Lector
{
  key Cliente as Lector,
      Nombre,
      Apellidos,
      Email,
      TipoAcceso,
      Imagen,
      _Lectores.Libro,

      _Lectores
}
