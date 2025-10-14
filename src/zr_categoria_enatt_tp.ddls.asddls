@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Base Categorias enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_Categoria_Enatt_TP
  as select from ztb_catego_enatt
{
  key bi_categ    as Categoria,
      descripcion as DescripcionCategoria
}
