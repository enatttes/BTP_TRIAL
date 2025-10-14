@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface Lectores x Libro enattesb'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Lectores_por_Libro_Enatt
  as select from ZI_Lectores_Enatt
{
  key Libro,
  key Lector,
  key TipoAcceso,
      Nombre,
      Apellidos,
      Email,
      Imagen

}
