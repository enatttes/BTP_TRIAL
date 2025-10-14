@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Base Libros enattesb'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_Libros_Enatt_TP
  as select from ztb_libros_enatt
{
  key id_libro  as Libro,
  key bi_categ  as Categoria,
      titulo    as Titulo,
      autor     as Autor,
      editorial as Editorial,
      idioma    as Idioma,
      paginas   as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      precio    as Precio,
      moneda    as Moneda,
      formato   as Formato,
      url       as Imagen
}
