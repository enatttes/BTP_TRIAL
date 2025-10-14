@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Base Clientes Lectores enatttesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_Clientes_Lectores_Enatt_TP
  as select from ztb_clientes_ena
{
  key id_cliente  as Cliente,
      tipo_acceso as TipoAcceso,
      nombre      as Nombre,
      apellidos   as Apellidos,
      email       as Email,
      url         as Imagen
}
