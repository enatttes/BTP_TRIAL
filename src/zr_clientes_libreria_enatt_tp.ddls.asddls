@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Base Clientes Libreria enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_Clientes_Libreria_Enatt_TP
  as select from ztb_clnts_lib_en
{
  key id_libro   as Libro,
  key id_cliente as Lector
}
