@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consumo Lectores enattesb'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_Lectores_Enatt
  as select from ZI_Clientes_Lectores_Enatt
{
  key Libro,
      Lector,
      Nombre,
      Apellidos,
      Email,
      TipoAcceso,
      Imagen,

      /* Associations */
      _Lectores
}
